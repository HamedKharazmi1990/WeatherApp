//
//  WeatherResponse.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let feelsLikeC: Double
    let feelsLikeF: Double
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case name, country
    }
}
