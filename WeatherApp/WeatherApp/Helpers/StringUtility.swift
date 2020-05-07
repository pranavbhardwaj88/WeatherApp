//
//  StringUtility.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 07/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

class StringUtility {
    static  func temperatureString(fromDouble temperature: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        
        let temperatureString = numberFormatter.string(from: NSNumber(value: temperature)) ?? "--"
        return "\(temperatureString)ºF"
    }
}
