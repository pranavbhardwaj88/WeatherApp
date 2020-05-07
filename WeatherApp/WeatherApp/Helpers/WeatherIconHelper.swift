//
//  WeatherIconHelper.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 07/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation
import SwiftUI

enum WeatherIcon: String {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain = "rain"
    case snow = "snow"
    case wind = "wind"
    case cloudy = "cloudy"
    case partyCloudyDay = "partly-cloudy-day"
    case partyCloudyNight = "partly-cloudy-night"
    
    var icon: String {
        switch self {
        case .clearDay:
            return  "sun.max.fill"
        case .clearNight:
            return "moon.stars.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return  "snow"
        case .wind:
            return "wind"
        case .cloudy:
            return "cloud.fill"
        case .partyCloudyDay:
            return "cloud.sun.fill"
        case .partyCloudyNight:
            return "cloud.moon.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .clearDay, .clearNight:
            return .yellow
        case .rain:
            return .blue
        case .snow:
            return .white
        case .wind, .cloudy,.partyCloudyDay, .partyCloudyNight :
            return .gray
        }
    }
}
