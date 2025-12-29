//
//  WeatherView.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import SwiftUI

struct WeatherView: View {
    @State private var vm = WeatherViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter city name", text: $vm.city)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await vm.fetch()
                    }
                } label: {
                    Label(
                        "Get Weather",
                        systemImage: "cloud.sun.fill"
                    )
                }.buttonStyle(.borderedProminent)
                    .padding()
                
                if vm.isLoading {
                    ProgressView("Fetching weather...")
                        .padding()
                } else if let weather = vm.weather {
                    WeatherCard(weather: weather)
                } else if let error = vm.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }
                
                Spacer()
            }.navigationTitle("Weather App")
        }
    }
}

#Preview {
    WeatherView()
}
