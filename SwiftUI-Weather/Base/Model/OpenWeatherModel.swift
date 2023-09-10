//
//  OpenWeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Eric on 09/09/2023.
//

import Foundation

struct Weather2: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Cloud
    let dt: Date
    let sys: Sy
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
  struct Coord: Codable {
    let lon: Double
    let lat: Double
  }

  struct Weather: Codable, Identifiable {
    let id: Int
    let main: String
    let description: String
    let icon: String
      
      var iconImage: String {
          if icon == "04n" {
          }
          return "smoke.fill"
      }
  }

  struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int

    private enum CodingKeys: String, CodingKey {
      case temp
      case feelsLike = "feels_like"
      case tempMin = "temp_min"
      case tempMax = "temp_max"
      case pressure
      case humidity
    }
      
      var tempText: Int {
          return Int(temp.rounded())
      }
  }

  struct Wind: Codable {
    let speed: Double
    let deg: Int
  }

  struct Cloud: Codable {
    let all: Int
  }

  struct Sy: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Date
    let sunset: Date
  }

 
}
