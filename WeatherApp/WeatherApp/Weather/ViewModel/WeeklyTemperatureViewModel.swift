//
//  WeeklyTemperatureViewModel.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 06/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

class WeeklyTemperatureViewModel: Identifiable {
    let id = UUID()
    
    let weather: DailyWeatherInfoModel
    
    init(weatherData: DailyWeatherInfoModel ) {
        self.weather = weatherData
    }
    
    var maxTemperature: String {
        guard let temperature = self.weather.temperatureHigh else {
            return "- ºF"
        }
        return StringUtility.temperatureString(fromDouble:temperature)
    }
    
    var minTemperature: String {
        guard let temperature = self.weather.temperatureLow else {
            return "--ºF"
        }
        return StringUtility.temperatureString(fromDouble:temperature)
    }
    
    var time: String {
        return Date(timeIntervalSince1970: weather.time).formattedDay
    }
    
    var weatherIcon: WeatherIcon {
        guard let icon = self.weather.icon else {
            return WeatherIcon.clearDay
        }
        return WeatherIcon.init(rawValue: icon) ?? WeatherIcon.clearDay
    }
}
