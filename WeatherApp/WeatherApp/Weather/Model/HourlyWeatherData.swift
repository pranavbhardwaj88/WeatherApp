//
//  HourlyWeatherData.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 06/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation
struct HourlyWeatherInforModel: Codable, Identifiable {
    var id: TimeInterval {
        return time
    }
    var time: TimeInterval
    var temperature: Double?
}
