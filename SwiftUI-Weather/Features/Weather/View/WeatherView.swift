//
//  WeatherView.swift
//  SwiftUI-Weather
//
//  Created by Eric on 09/09/2023.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var vm = WeatherViewModel()
    let lat: Double
    let lon: Double
    
    var body: some View {
        VStack {
            if vm.weatherData != nil {
                Text(vm.weatherData!.name)
                Text("\(vm.weatherData!.main.temp)")
            }
        }
        .task {
            await vm.fetchWeather(lat: lat, lon: lon)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(lat: 37.32, lon: -122.03)
    }
}
