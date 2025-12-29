//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import Foundation

@Observable
class WeatherViewModel {
    var city: String = ""
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiKey = "APIKEY"
    
    private func fetchWeather(for city: String) async throws -> WeatherResponse {
        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        
        
        
        
        return .init(
            location: .init(
                name: "London",
                country: "England"
            ),
            current: .init(
                tempC: 30,
                condition: .init(
                    text: "Great Condition",
                    icon: "Icon Name"
                ),
                feelsLikeC: 32.5
            )
        )
    }
}
