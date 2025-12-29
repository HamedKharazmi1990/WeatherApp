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
    
    private var apiKey: String {
        guard
            let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
            let key = dict["API_KEY"] as? String
        else { return "" }
        
        return key
    }
    
    private func fetchWeatherData(for city: String) async throws -> WeatherResponse {
        // Build URL
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Validate response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknown
        }
        
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
        // Decode Model
        do {
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            throw WeatherError.decodingFailed
        }
    }
    
    @MainActor
    func fetch() async {
        do {
            weather = try await fetchWeatherData(for: city)
            errorMessage = nil
        } catch {
            if let weatherError = error as? WeatherError {
                errorMessage = weatherError.localizedDescription
            } else {
                errorMessage = "Unexpected error: \(error.localizedDescription)"
            }
            
            // Reset weather
            weather = nil
        }
    }
}
