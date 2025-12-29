# 🌦️ Weather App (SwiftUI)

A modern and lightweight iOS app that fetches and displays real-time weather data for any city using the [WeatherAPI](https://www.weatherapi.com/) service.  
Built with **SwiftUI**, **async/await**, and a clean **MVVM** architecture.


## Demo
<p align="center">
  <img src="./assets/demo_weatherApp.gif" width="420" alt="WeatherApp Demo" />
</p>

---

## ✨ Features

- 🔎 Search weather by **city name**
- 🌡️ Toggle between **Celsius** and **Fahrenheit** (persisted using `@AppStorage`)
- 🖼️ Dynamic weather icons via `AsyncImage`
- ⚡ Fast and responsive UI built with **SwiftUI**
- ❗ User-friendly error handling
- 🧱 Clean and scalable **MVVM** architecture

---

## 🧰 Tech Stack

| Category | Technology |
|--------|------------|
| **Language** | Swift |
| **Framework** | SwiftUI |
| **Architecture** | MVVM |
| **Networking** | URLSession + Codable |
| **Concurrency** | async/await |
| **Minimum iOS** | 18.5 |
| **IDE** | Xcode 16+ |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone "https://github.com/HamedKharazmi1990/WeatherApp"
cd "Weather App"
```

### 2️⃣ Create Your Weather API Key

    1. Get a free API key from WeatherAPI.
    2. Create a file named `Secrets.plist` at the following path:
        Weather App/Weather App/Config/Secrets.plist
    3. Paste the following content and replace `YOUR_WEATHERAPI_KEY`:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>API_KEY</key>
        <string>YOUR_WEATHERAPI_KEY</string>
        </dict>
    </plist>

⚠️ Do not commit your real API key.

### 3️⃣ Open & Run
    1.    Open Weather App/Weather App.xcodeproj in Xcode 16+
    2.    Choose an iOS 18.5+ simulator
    3.    Press Run (⌘R)

### 💡 Usage
    1.    Enter a city name (e.g. Berlin, New York, Tehran)
    2.    Tap Search to fetch live weather data
    3.    Use the gear icon to switch between Celsius and Fahrenheit

 ###   🧩 Project Structure
     Weather App
    ├── Assets.xcassets
    ├── Config
    │   └── Secrets.plist          # API key (ignored by git)
    ├── Models
    │   └── WeatherResponse.swift  # Codable API models
    ├── ViewModels
    │   ├── WeatherError.swift     # User-friendly error handling
    │   └── WeatherViewModel.swift # Async fetch & state management
    ├── Views
    │   ├── ErrorMessageView.swift
    │   ├── WeatherCard.swift      # Weather snapshot UI
    │   └── WeatherView.swift      # Main search & display view
    ├── Weather_App.entitlements
    └── Weather_AppApp.swift       # App entry point

 ###   🔄 Data Flow
    WeatherView
     ↓ triggers
    WeatherViewModel.search()
     ↓ fetches
    WeatherAPI → Decode → WeatherResponse
     ↓ updates
    WeatherCard + ErrorMessageView

### API Request Example
    https://api.weatherapi.com/v1/current.json?key=<API_KEY>&q=<CITY>&aqi=no

### ⚙️ Configuration & Secrets
The app reads the API key securely from Secrets.plist using:

    Bundle.main.url(forResource: "Secrets", withExtension: "plist")

❌ Never hardcode API keys directly in source files.

### 🧾 .gitignore for Secrets
Add the following rules to your .gitignore file:

    # macOS
    .DS_Store

    # Xcode user data
    *.xcuserstate
    *.xcuserdatad

    # Secrets
    **/Config/Secrets.plist

###   🧰 Troubleshooting
| Problem | Possible Fix |
|--------|------------|
| **401 / 403 Unauthorized** | Check your WeatherAPI key and free plan limits |
| **Decoding Error** | Verify API response structure and key validity |
| **No Results Found** | Try a more common city name |

### 🙏 Acknowledgments
[WeatherAPI](https://www.weatherapi.com/) — for providing free weather data and icons

### 👨‍💻 Maintainer

    Hamed Kharazmi
    📧 hamed.kharazmi@gmail.com


    
