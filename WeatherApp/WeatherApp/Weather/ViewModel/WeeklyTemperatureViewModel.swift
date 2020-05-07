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
        return "\(Int(temperature))ºF"
    }
    
    var minTemperature: String {
        guard let temperature = self.weather.temperatureLow else {
            return "--ºF"
        }
        return "\(Int(temperature))ºF"
    }
    
    var time: String {
        return Date(timeIntervalSince1970: weather.time).formattedDay
    }
}
