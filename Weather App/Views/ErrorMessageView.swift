//
//  ErrorMessageView.swift
//  Weather App
//
//  Created by Hamed Kharazmi on 29.12.25.
//

import SwiftUI

struct ErrorMessageView: View {
    private let friendlyMessages: [String] = [
        "Something went wrong - Please try again.",
        "We couldn't fetch the weather. Maybe the clouds are blocking the signals?",
        "A minor hiccup occurred. Please try again later.",
        "Looks like the connection took a coffee break. Please try again soon.",
        "weather data failed to load. Let's give it another go soon."
    ]
    
    var message: String {
        friendlyMessages.randomElement() ?? "Something went wrong"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "cloud.drizzle.fill")
                .font(.largeTitle)
            
            Text("Weather Unavailable")
                .font(.headline)
            
            Text(message)
                .font(.subheadline)
                .bold()
                .multilineTextAlignment(.center)
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
        .foregroundStyle(.white.opacity(0.9))
    }
}

#Preview {
    ErrorMessageView()
}
