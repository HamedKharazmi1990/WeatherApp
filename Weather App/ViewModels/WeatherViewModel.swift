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
}
