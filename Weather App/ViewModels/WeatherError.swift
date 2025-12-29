//
//  WeatherError.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import Foundation

enum WeatherError: LocalizedError {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided city name is invalid."
        case .requestFailed(statusCode: let statusCode):
            return "Request failed with status code: \(statusCode). Please try again later."
        case .decodingFailed:
            return "Unable to decode the weather data. The server may have changed its response format."
        case .unknown:
            return "An unknown error occured."
        }
    }
}
