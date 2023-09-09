//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Eric on 09/09/2023.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published private(set) var weatherData: Weather2?
    
    @MainActor
    func fetchWeather(lat: Double, lon: Double) async {
        do {
            self.weatherData = try await NetworkingManager.shared.request(.weather(lat: lat, lon: lon))
        } catch {
            print("error")
        }
    }
}
