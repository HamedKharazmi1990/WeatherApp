//
//  WeatherCard.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import SwiftUI

struct WeatherCard: View {
    let weather: WeatherResponse
    
    var urlString: String {
        "https:\(weather.current.condition.icon)"
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlString)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } else {
                    ProgressView()
                }
            }
            
            Text("\(weather.location.name), \(weather.location.country)")
                .font(.title2)
                .bold()
            
            Text("\(weather.current.tempC, specifier: "%.1f")°C")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            
            Text(weather.current.condition.text)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
            
            Text("Feels like \(weather.current.feelsLikeC, specifier: "%.1f")°C")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.blue, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(.rect(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
    }
}

//#Preview {
//    WeatherCard()
//}
