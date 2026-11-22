#!/usr/bin/env bash
# Recursive Hebrew transcription. Override paths and thread count via environment.
set -uo pipefail
SCRIPT_DIR="$(cd "$(dirname "\${BASH_SOURCE[0]}")" && pwd -P)"
BASE_DIR="\${BASE_DIR:-$SCRIPT_DIR}"
INPUT_DIR="\${INPUT_DIR:-$BASE_DIR/Input}"
OUTPUT_DIR="\${OUTPUT_DIR:-$BASE_DIR/output}"
WHISPER_DIR="\${WHISPER_DIR:-$BASE_DIR/whisper.cpp}"
MODEL_PATH="\${MODEL_PATH:-$WHISPER_DIR/models/ggml-large-v3.bin}"
WHISPER_CLI="\${WHISPER_CLI:-$WHISPER_DIR/build/bin/whisper-cli}"
WHISPER_THREADS="\${WHISPER_THREADS:-8}"
FORCE=0

if [[ "$#" -eq 1 && "$1" == "--force" ]]; then FORCE=1
elif [[ "$#" -ne 0 ]]; then printf 'Usage: %s [--force]\n' "$0" >&2; exit 2
fi
if [[ ! -d "$INPUT_DIR" ]]; then
    printf 'Input directory not found: %s\n' "$INPUT_DIR" >&2; exit 1
fi
command -v ffmpeg >/dev/null 2>&1 || { echo "ffmpeg is required" >&2; exit 1; }
[[ -x "$WHISPER_CLI" && -s "$MODEL_PATH" ]] || {
    printf 'Whisper executable or model missing: %s / %s\n' "$WHISPER_CLI" "$MODEL_PATH" >&2
    exit 1
}
[[ "$WHISPER_THREADS" =~ ^[1-9][0-9]*$ ]] || {
    echo 'WHISPER_THREADS must be a positive integer' >&2; exit 2
}
mkdir -p "$OUTPUT_DIR" || exit 1
INPUT_ROOT="$(cd "$INPUT_DIR" && pwd -P)"
OUTPUT_ROOT="$(cd "$OUTPUT_DIR" && pwd -P)"

transcribe_video() (
    local video="$1" relative dirname_part video_name destination prefix scratch ext
    relative="\${video#"$INPUT_ROOT"/}"
    dirname_part="$(dirname "$relative")"
    video_name="$(basename "$relative")"
    destination="$OUTPUT_ROOT"
    [[ "$dirname_part" == "." ]] || destination="$OUTPUT_ROOT/$dirname_part"
    mkdir -p "$destination" || exit 1
    # The original extension avoids collisions between same-stem videos.
    prefix="$destination/$video_name"
    if [[ "$FORCE" -eq 0 &&
        -s "$prefix.txt" && -s "$prefix.srt" && -s "$prefix.vtt" &&
        "$prefix.txt" -nt "$video" && "$prefix.srt" -nt "$video" &&
        "$prefix.vtt" -nt "$video" && "$prefix.txt" -nt "$MODEL_PATH" ]]; then
        printf 'SKIP %s\n' "$relative"
        exit 0
    fi
    scratch="$(mktemp -d "$destination/.transcribe.XXXXXXXX")" || exit 1
    trap 'rm -rf "$scratch"' EXIT
    printf 'TRANSCRIBE %s\n' "$relative"
    if ! ffmpeg -nostdin -hide_banner -loglevel error -y -i "$video" \
        -vn -ar 16000 -ac 1 -c:a pcm_s16le "$scratch/audio.wav"; then
        printf 'FAIL audio extraction: %s\n' "$relative" >&2
        exit 1
    fi
    if ! DYLD_LIBRARY_PATH="$WHISPER_DIR/build/src:$WHISPER_DIR/build/ggml/src:$WHISPER_DIR/build/ggml/src/ggml-blas:$WHISPER_DIR/build/ggml/src/ggml-metal\${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}" \
        "$WHISPER_CLI" -l he -m "$MODEL_PATH" -f "$scratch/audio.wav" \
        -of "$scratch/result" -otxt -osrt -ovtt -t "$WHISPER_THREADS" \
        --processors 1 --split-on-word --max-len 30 --temperature 0.0; then
        printf 'FAIL whisper: %s\n' "$relative" >&2
        exit 1
    fi
    for ext in txt srt vtt; do
        [[ -s "$scratch/result.$ext" ]] || {
            printf 'FAIL missing %s output: %s\n' "$ext" "$relative" >&2
            exit 1
        }
    done
    # No existing output is replaced until all three formats are present.
    for ext in txt srt vtt; do
        mv -f "$scratch/result.$ext" "$prefix.$ext" || exit 1
    done
    printf 'OK %s\n' "$relative"
)

total=0; ok=0; failed=0
while IFS= read -r -d '' video; do
    total=$((total + 1))
    if transcribe_video "$video"; then ok=$((ok + 1))
    else failed=$((failed + 1))
    fi
done < <(find "$INPUT_ROOT" -type f \( -iname '*.mp4' -o -iname '*.mkv' \
    -o -iname '*.mov' -o -iname '*.webm' -o -iname '*.m4v' \) -print0)
printf 'Completed: %s/%s transcribed or skipped; %s failed. Output: %s\n' \
    "$ok" "$total" "$failed" "$OUTPUT_ROOT"
[[ "$failed" -eq 0 ]]
