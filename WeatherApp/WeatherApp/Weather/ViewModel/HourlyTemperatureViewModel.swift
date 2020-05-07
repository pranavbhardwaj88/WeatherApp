//
//  HourlyTemperatureViewModel.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 06/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

class HourlyTemperatureViewModel: Identifiable {
    let id = UUID()
    
    let weather: HourlyWeatherInforModel
    
    init(weatherData: HourlyWeatherInforModel ) {
        self.weather = weatherData
    }
    
    var temperature: String {
        guard let temperature = self.weather.temperature else {
            return "--ºF"
        }
        return StringUtility.temperatureString(fromDouble:temperature)
    }
    
    var time: String {
        return Date(timeIntervalSince1970: weather.time).formattedHour
    }
    
    var weatherIcon: WeatherIcon {
        guard let icon = self.weather.icon else {
            return WeatherIcon.clearDay
        }
        return WeatherIcon.init(rawValue: icon) ?? WeatherIcon.clearDay
    }
}
