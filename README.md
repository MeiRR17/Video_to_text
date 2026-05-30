# Video to Text Transcription Tool

An automated video transcription pipeline using OpenAI's Whisper.cpp, optimized for Hebrew lecture videos on Apple Silicon Macs.

## Overview

This project provides a complete workflow for transcribing video lectures into text format with support for multiple output formats (TXT, SRT, VTT). It's specifically optimized for Hebrew language content and Apple Silicon (M-series) processors.

## Features

- **Multi-format Output**: Generates plain text (.txt), subtitles (.srt), and web captions (.vtt)
- **Hebrew Language Support**: Optimized for Hebrew transcription with proper language detection
- **Apple Silicon Optimized**: Uses Metal GPU acceleration on M-series Macs
- **Repetition Cleaning**: Built-in post-processing to remove transcription loops and duplicates
- **Batch Processing**: Process entire folders of videos automatically
- **Organized Output**: Separates transcripts by course/folder structure

## Project Structure

```
.
├── Input/                    # Place video files here (organized by course)
│   ├── DL/                  # Deep Learning videos
│   ├── RM/                  # Research Methods videos
│   └── BD/                  # Big Data videos
├── output/                  # Generated transcripts (mirrors Input structure)
├── temp_audio/             # Temporary audio extraction folder
├── whisper.cpp/            # Whisper.cpp repository (submodule)
├── transcribe_all.sh       # Main transcription script
├── clean_repetitions.py    # Post-processing script
└── README.md
```

## Prerequisites

### Required Software

- **macOS** with Apple Silicon (M1/M2/M3) for optimal performance
- **Homebrew** package manager
- **ffmpeg** for audio extraction
- **Python 3** for cleaning scripts
- **Git** for cloning whisper.cpp

### Installation

1. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install ffmpeg**:
   ```bash
   brew install ffmpeg
   ```

3. **Clone and setup whisper.cpp**:
   ```bash
   git clone https://github.com/ggerganov/whisper.cpp.git
   cd whisper.cpp
   
   # Build with Metal support for Apple Silicon
   cmake -B build -DWHISPER_METAL=ON
   cmake --build build --config Release
   
   # Download the large-v3 model (best quality for Hebrew)
   bash models/download-ggml-model.sh large-v3
   ```

## Usage

### 1. Prepare Your Videos

Organize your video files in the `Input/` directory by course/folder:

```
Input/
├── DL/
│   ├── lecture1.mp4
│   └── lecture2.mp4
└── RM/
    └── lecture3.mp4
```

### 2. Run Transcription

Make the script executable and run it:

```bash
chmod +x transcribe_all.sh
./transcribe_all.sh
```

The script will:
1. Extract 16kHz mono audio from each video
2. Transcribe using whisper.cpp with Hebrew language settings
3. Generate TXT, SRT, and VTT files in the `output/` directory
4. Clean up temporary audio files

### 3. Clean Repetitions (Optional)

Whisper sometimes produces repetitive output. Run the cleaning script:

```bash
python3 clean_repetitions.py
```

This removes consecutive duplicate lines from all output files.

## Configuration

### Transcription Settings

Edit `transcribe_all.sh` to customize:

| Setting | Default | Description |
|---------|---------|-------------|
| `-t 8` | 8 threads | Number of CPU threads |
| `--processors 1` | 1 | Audio processors |
| `--max-len 30` | 30 chars | Maximum segment length |
| `--temperature 0.0` | 0.0 | Sampling temperature (0=deterministic) |
| `-l he` | Hebrew | Language code |

### Model Selection

Different models offer speed/accuracy tradeoffs:

| Model | Size | Speed | Quality | Use Case |
|-------|------|-------|---------|----------|
| `tiny` | 75 MB | Fastest | Basic | Quick testing |
| `base` | 142 MB | Fast | Good | Balanced |
| `small` | 466 MB | Medium | Better | Regular use |
| `medium` | 1.5 GB | Slow | Very Good | High quality |
| `large-v3` | 2.9 GB | Slowest | Best | Maximum accuracy |

Change the model in `transcribe_all.sh`:
```bash
MODEL_PATH="$WHISPER_DIR/models/ggml-small.bin"
```

## Output Formats

### TXT (Plain Text)
Clean transcription without timestamps. Best for reading or further text processing.

### SRT (SubRip Subtitles)
Standard subtitle format with timing information:
```
1
00:00:00,000 --> 00:00:05,000
Hello world
```

### VTT (WebVTT)
Web-native caption format for HTML5 video players.

## Troubleshooting

### "Model file not found"
Download the model: `bash models/download-ggml-model.sh large-v3`

### "FFmpeg error occurred"
- Check video file integrity
- Ensure ffmpeg is installed: `brew install ffmpeg`

### Slow transcription
- Use a smaller model (e.g., `medium` instead of `large-v3`)
- Increase thread count: change `-t 8` to `-t 12`

### Poor transcription quality
- Ensure audio quality is good (clear speech, minimal noise)
- Use the `large-v3` model for best results
- Check that `-l he` is set for Hebrew content

## Performance Tips

1. **Apple Silicon Optimization**: The build uses Metal GPU acceleration automatically on M-series Macs
2. **Batch Processing**: Process multiple videos overnight
3. **Audio Quality**: Better input audio = better transcription (16kHz mono is optimal)
4. **Storage**: Large model requires ~3GB RAM during transcription

## Dependencies

- [whisper.cpp](https://github.com/ggerganov/whisper.cpp) - OpenAI Whisper C++ implementation
- [ffmpeg](https://ffmpeg.org/) - Audio/video processing
- Python 3.6+ - Cleaning scripts

## License

This project is open source. whisper.cpp is licensed under the MIT License.

## Acknowledgments

- OpenAI for the Whisper model
- ggerganov for the excellent whisper.cpp implementation
- The Hebrew language transcription community

## Contributing

Feel free to submit issues or improvements:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

---

**Author**: MeiRR17  
**Repository**: https://github.com/MeiRR17/Video_to_text
