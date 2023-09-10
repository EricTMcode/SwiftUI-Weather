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
        ZStack {
            BackgroundView2()
            
            
            if vm.weatherData != nil {
                WeatherStatusView(weather: vm.weatherData!)
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

struct BackgroundView2: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherStatusView: View {
    
    let weather: Weather2
    
    var body: some View {
        VStack {
            Text(weather.name)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
                .padding()
            
            VStack(spacing: 10) {
                ForEach(weather.weather) { weather in
                    Image(systemName: weather.iconImage)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                }
                
                Text("\(weather.main.tempText)°c")
                    .font(.system(size: 60, weight: .medium))
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}
