# SentimentLens 🔍✨

![iOS 18.0+](https://img.shields.io/badge/iOS-18.0%2B-blue.svg)
![Swift 5.9+](https://img.shields.io/badge/Swift-5.9%2B-orange.svg)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-red.svg)
![CoreML](https://img.shields.io/badge/Machine_Learning-CoreML-purple.svg)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)

**SentimentLens** is a modern iOS application that performs real-time sentiment analysis on social media text using on-device machine learning. By simply typing a `@mention` or `#hashtag`, users can instantly visualize the overarching emotional tone—positive, negative, or neutral—drawn from a localized dataset of Brazilian Portuguese social media reviews.

Built with the latest Apple technologies, this project demonstrates a strong integration of **CoreML**, **SwiftUI**, and modern **MVVM architecture**.

---

## 📸 Previews

| <img src="https://github.com/user-attachments/assets/67ad682a-1795-4cf8-9938-a259e722723a" width="250" alt="Light Mode UI"/> | <img src="https://github.com/user-attachments/assets/74425163-5409-423c-9916-a0aacf68f405" width="250" alt="Dark Mode UI"/> |
|:---:|:---:|
| **Light Mode** | **Dark Mode** |

---

## 🚀 Key Features

- **Real-Time Analysis:** Instantaneous sentiment filtering and processing that updates seamlessly as the user types.
- **On-Device Machine Learning:** Utilizes CoreML for fast, privacy-preserving text classification without requiring network calls.
- **Advanced Data Parsing:** Includes a custom, quote-aware CSV parser capable of handling edge cases and dirty dataset strings natively.
- **Dynamic Threshold Algorithm:** Replaces simple majority voting with a percentage-based dominance threshold (38.33%) for highly accurate sentiment aggregation.
- **Modern Glassmorphism UI:** Features premium aesthetics using SwiftUI's `.ultraThinMaterial` for frosted glass effects, smooth gradient transitions, and responsive emoji feedback.
- **Adaptive Design:** Fully supports system-wide Dark and Light modes.

---

## 🧠 How It Works

1. **Ingestion:** The app parses 1,050 social media reviews from an embedded CSV dataset upon launch.
2. **Filtering:** As a user inputs a target query (e.g., `@iFood` or `#pizza`), the app filters the dataset for matching strings.
3. **Classification:** Each matching review is passed through the `socialMediaClassifierModel` (CoreML) to determine its individual sentiment.
4. **Aggregation:** The app calculates the distribution of sentiments and applies a dominance threshold.
5. **Visualization:** The UI immediately reflects the aggregated sentiment via dynamic emoji representations and a statistical summary.

### Sentiment Detection Logic

To prevent edge cases where a sentiment "wins" by a negligible margin in a large dataset, SentimentLens employs a custom threshold system:

- **Baseline:** Equal distribution across 3 sentiments = 33.33%
- **Dominance Threshold:** 33.33% + 5% buffer = **38.33%**
- **Outcome:** If a sentiment exceeds 38.33% of the total, it is declared the dominant tone. If none cross the threshold, the result is intelligently classified as "Mixed".

---

## 🏗 Architecture

The app strictly follows the **MVVM (Model-View-ViewModel)** design pattern, leveraging Swift's modern `@Observable` macro for clean state management and separation of concerns.

```text
SentimentLens/
├── Models/
│   ├── Review.swift                       # Data representation of a single review
│   ├── SentimentResult.swift              # Enums and analysis result structures
│   └── socialMediaClassifierModel.mlmodel # CoreML text classifier
├── ViewModels/
│   └── SentimentViewModel.swift           # Reactive business logic and data binding
├── Views/
│   └── ContentView.swift                  # Main interface featuring glassmorphic cards
├── Services/
│   ├── CSVParser.swift                    # Robust, quote-aware CSV reader
│   └── SentimentAnalyzer.swift            # CoreML model wrapper and evaluation logic
└── Resources/
    └── socialMediaReviews.csv             # 1,050-row Brazilian Portuguese dataset
```

---

## 🛠 Tech Stack & Requirements

| Category | Technology |
|:---|:---|
| **UI Framework** | SwiftUI |
| **Machine Learning** | CoreML, Natural Language |
| **State Management** | `@Observable` (Observation framework) |
| **Assets** | SF Symbols |
| **Deployment Target** | iOS 18.0+ |
| **Development Environment** | Xcode 16+, Swift 5.9+ |

---

## 💻 Getting Started

This project is fully self-contained with no third-party dependencies. Follow these steps to run it locally:

**1.** Clone the repository to your local machine:

```bash
git clone https://github.com/cemakkaya-dev/SentimentLens-SwiftUI.git
```

**2.** Navigate into the project directory:

```bash
cd SentimentLens-SwiftUI
```

**3.** Open the project in Xcode:

```bash
open SentimentLens.xcodeproj
```

**4.** Select a simulator or physical device running **iOS 18.0+** and hit Run (`Cmd` + `R`).

> **Note:** No external packages or dependencies are required — everything runs entirely on-device.

---

## 📊 Dataset Context

The embedded dataset consists of **1,050 Brazilian Portuguese** social media reviews specifically focused on food delivery services. It encompasses a realistic mix of positive, negative, and neutral sentiments, heavily featuring brand `@mentions` and topical `#hashtags` to accurately simulate real-world social media scraping.

---

## 👨‍💻 Developer

**Cem Akkaya**

[![GitHub](https://img.shields.io/badge/GitHub-cemakkaya--dev-181717?logo=github)](https://github.com/cemakkaya-dev)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin)](https://linkedin.com/in/cemakkaya-dev/)
[![Email](https://img.shields.io/badge/Email-Contact-EA4335?logo=gmail)](mailto:cemakkaya1312@gmail.com)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
