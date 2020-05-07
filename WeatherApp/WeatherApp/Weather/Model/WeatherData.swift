//
//  WeatherInfo.swift
//  KlarnaWeatherApp
//
//  Created by Pranav Bhardwaj on 27/04/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

struct CurrentWeatherInfo: Codable, Identifiable {
    var id: TimeInterval {
        return time
    }
    var time: TimeInterval
    var summary: String?
    var icon: String?
    var precipIntensity: Double?
    var precipProbability: Double?
    var temperature: Double?
    var apparentTemperature: Double?
    var dewPoint: Double?
    var humidity: Double?
    var pressure: Double?
    var windSpeed: Double?
    var windGust: Double?
    var windBearing: Double?
    var cloudCover: Double?
    var uvIndex: Double?
    var visibility: Double?
    var ozone: Double?
}

