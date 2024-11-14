//
//  ContentView.swift
//  SwifUI-Weather
//
//  Created by Mitchell Desjardins on 2024-11-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Quebec City")
                
                TodayWeatherView(imageName: isNight ?  "cloud.moon.fill" :"cloud.sun.fill", temperature: 20)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 0)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 15)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.snow.fill", temperature: -5)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.headline)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? Color("lightBlue") : .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
   var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.title)
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°C")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}



