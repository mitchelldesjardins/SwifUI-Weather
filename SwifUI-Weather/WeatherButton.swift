//
//  WeatherButton.swift
//  SwifUI-Weather
//
//  Created by Mitchell Desjardins on 2024-11-10.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .cornerRadius(10)
    }
}
