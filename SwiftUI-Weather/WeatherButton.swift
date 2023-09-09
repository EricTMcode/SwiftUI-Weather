//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Eric on 09/09/2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
    }
}
