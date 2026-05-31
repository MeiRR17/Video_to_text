# קורס למידה עמוקה (Deep Learning) - תשפ"ו
## מרצה: ד"ר רינה אזולאי

---

## 📚 מבנה התיקייה

```
DL_organized/
├── DL1/          # מבוא וחזרה על למידת מכונה
├── DL2/          # הנוירון הבודד והמתמטיקה של הלמידה
├── DL3/          # רשתות עמוקות, Backpropagation ואופטימיזציה
├── DL4/          # אופטימייזרים ורשתות קונבולוציה (CNN)
├── DL5/          # ארכיטקטורות CNN מתקדמות, Transfer Learning
├── DL6/          # עיבוד שפה טבעית (NLP) ו-Word Embeddings
├── DL7/          # רשתות רקורנטיות (RNN, LSTM, GRU)
├── DL8/          # Attention ו-Transformers
├── DL9/          # BERT, GPT וחוקי עבודה עם AI
├── exercises/    # תרגילים
├── projects/     # פרויקטים
└── resources/    # משאבים נוספים
```

---

## 📖 סיכומי שיעורים

### שיעור 1 - מבוא וחזרה על למידת מכונה
- מבנה הקורס ומטרתו
- מושגי יסוד: Target, Features, Example, Label
- סוגי למידה: Supervised, Unsupervised
- חלוקת נתונים: Train, Validation, Test
- מדדי הערכה: Accuracy, Precision, Recall, F1, ROC/AUC
- Bias-Variance Tradeoff
- Loss Function מול Error Metrics
- Gradient Descent

### שיעור 2 - הנוירון הבודד
- השראה ביולוגית והנוירון המלאכותי
- רגרסיה ליניארית כנוירון בודד
- Gradient Descent ופונקציה קמורה
- כלל השרשרת (Chain Rule)
- מעבר לסיווג ו-Feed Forward
- Sigmoid ו-Binary Cross Entropy

### שיעור 3 - רשתות עמוקות
- Forward Pass ברשת מלאה
- Backpropagation
- בעיית Vanishing Gradients
- פונקציות אקטיבציה: ReLU, Leaky ReLU, Tanh
- Data Normalization
- Regularization: L1, L2
- Batching: Full Batch, SGD, Mini-Batch

### שיעור 4 - אופטימייזרים ו-CNN
- אופטימייזרים: Momentum, NAG, AdaGrad, RMSProp, Adam
- למה CNN יעילה יותר מ-Fully Connected
- פילטרים (Kernels) וקונבולוציה
- מבנה רשת CNN קלאסית
- Softmax ו-Categorical Cross-Entropy

### שיעור 5 - ארכיטקטורות CNN מתקדמות
- חישוב פרמטרים
- ארכיטקטורות: VGG, ResNet, Inception
- Transfer Learning ו-Fine Tuning
- Data Augmentation
- Functional API ב-Keras

### שיעור 6 - NLP ו-Word Embeddings
- האתגר בעיבוד טקסטים
- Tokenization, Stemming, One-Hot Encoding
- Word Embeddings
- Word2Vec: CBOW, Skip-gram
- Autoencoders ו-Latent Space

### שיעור 7 - RNN, LSTM, GRU
- רשתות רקורנטיות (RNN)
- LSTM ושערי הזיכרון
- BiLSTM ו-GRU
- סיווג טקסט (20 Newsgroups)
- TextVectorization ו-Embedding

### שיעור 8 - Attention ו-Transformers
- למה עזבנו את RNN/LSTM
- מילים מרובות משמעויות (Polysemy)
- מנגנון Attention: Q, K, V
- Multi-Head Attention
- Positional Encoding
- Masking
- יצירת טקסט (Text Generation)

### שיעור 9 - BERT, GPT וחוקי עבודה עם AI
- Self-Attention ו-Positional Encoding
- BERT מול GPT
- Masked Language Modeling
- Causal/Unidirectional
- RLHF (Reinforcement Learning from Human Feedback)
- ארכיטקטורת Encoder Block
- חוקי עבודה עם AI
- שקיפות בשימוש ב-AI
- Transfer Learning לסיווג אודיו

---

## 📝 תרגילים

### תרגיל 1: הקדמה ללמידה עמוקה ול-gradient descent
- [Gradient Descent](https://)
- [MNIST database](https://)
- [למידת זיהוי ספרות](https://)

### תרגיל 2: רשת CNN
- [תרגיל 2: רשת CNN](https://)

### תרגיל 3: NLP ו-RNN
- [תרגיל 3 למידה עמוקה](https://)
- [sentiment analysis](https://)

---

## 🎯 פרויקט סיום
- [פרויקט סיום בלמידת מכונה - תשפ"ו](https://)

---

## 📚 ספרי לימוד ומאגרים

### ספרים בעברית
- [למידה עמוקה - ספר בעברית](https://)
- [למידת מכונה בשפת פייתון](https://)
- [המאגר המלא לבינה מלאכותית ודאטה סיינס בעברית](https://)

### ספרים באנגלית
- [Deep Learning with Python](https://)
- [Deep Learning Cookbook](https://)
- [Hands on Machine Learning with Scikit Learn and Tensorflow](https://)
- [Deep Learning Book](https://)
- [Dive into Deep Learning](https://)

### קורסים ומשאבים חיצוניים
- [קורס DL של INTEL](https://)
- [github של הספר](https://)

---

## 🔗 קישורים לשיעורים ומחברות

### שיעור 1 - הקדמה
- [שיעור 1 - הקדמה (PDF)](https://)
- [מחברת הדגמה של linear regression](https://)
- [Linear regression with Gradient Descent](https://)
- [דוגמה לקוד לבנייה רשת עם Hidden Layer בודד](https://)
- [Predict house prices: regression](https://)
- [Getting started with neural networks](https://)

### שיעור 2 - רשתות נוירוניות
- [שיעור 2: רשתות נוירוניות (PDF)](https://)
- [איזו פונקצית אקטיבציה נבחר: חזרה (PDF)](https://)
- [תרגיל 1: זיהוי ספרות](https://)

### שיעור 3 - שיטות אופטימיזציה
- [שיעור 3: שיטות אופטימיזציה (PDF)](https://)

### שיעור 4 - CNN
- [DL lesson 4 CNNs (PDF)](https://)
- [למידה עמוקה - CNN (PDF)](https://)
- [CNN explainer](https://)
- [רשת CNN לזיהוי ספרות MNIST](https://)
- [דוגמה ל- Fine-tuning על רשת מאומנת](https://)
- [דוגמה ל-CNN כשיש מעט דוגמאות](https://)
- [Functional API](https://)

### שיעור 5 - Text Processing
- [DL lesson 5 Text Processing (PDF)](https://)

### שיעור 6 - RNNs
- [DL lesson 6 RNNs updated (PDF)](https://)
- [Using pre-trained word embeddings and rnn\cnn for text clasification](https://)
- [תרגיל 3 למידה עמוקה (PDF)](https://)
- [sentiment analysis (PDF)](https://)
- [תרגול: Text generation with LSTM](https://)
- [הקדמה ל-RNN](https://)
- [Understanding LSTM](https://)
- [RNNs and LSTM (PDF)](https://)
- [המחשה ויזואלית](https://)
- [Illustrated Guide to LSTM's and GRU's](https://)

### שיעור 6b - Transformers
- [DL lesson 6b transformers (PDF)](https://)
- [הסבר על Self Attention - סרטון](https://)
- [Lesson 6C (PDF)](https://)
- [Attention in transformers, step-by-step](https://)
- [Attention and Transformers: Intuitions](https://)
- [Understanding the attention mechanism in sequence models](https://)
- [דוגמה פשוטה של sequence to sequence](https://)
- [קבצים עבור sequence to sequence models](https://)
- [Simple seq2seq transformer](https://)
- [Fine-tune a multilingual Sequence-to-Sequence model like BART](https://)
- [קבצים עבור mBart](https://)
- [Illustrated Transformer](https://)
- [Bert Visualize](https://)

---

## 🎥 הקלטות שיעורים
- [הקלטות שיעורים תשפ"ו](https://)

---

## 💡 טיפים ללמידה אפקטיבית

1. **התחל עם הסיכום המסודר** - קרא את הסיכום בכל תיקייה לפני שתעבור על התמלול
2. **תרגול מעשי** - השתמש במחברות Colab ובדוגמאות הקוד
3. **פתר תרגילים** - התרגילים הם חלק קריטי מהלמידה
4. **השתמש במשאבים חיצוניים** - הספרים והקישורים יכולים לעזור בהבנה עמוקה יותר
5. **תכנן את הפרויקט** - השתמש בסיכומים כבסיס לתכנון הפרויקט

---

## 📞 קשר ותמיכה
- [לוח הודעות פורום](https://)
- [דיווח תקלות](https://)
- [כתובת הזום לשיעור](https://)

---

*עודכן לאחרונה: יוני 2026*
