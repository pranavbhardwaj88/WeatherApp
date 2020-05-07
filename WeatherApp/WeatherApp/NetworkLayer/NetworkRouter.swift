//
//  NetworkRouter.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation
enum NetworkRouter {
    case getWeatherData(latitude: Double, longitude:Double)
    
    var scheme: String {
        return try! Config.value(for: "URL_SCHEME")
    }
    
    var host: String {
        return try! Config.value(for: "BASE_URL")
    }
    
    var method: String {
        switch self {
        case .getWeatherData:
            return "GET"
        }
    }
    
    var path: String {
        let apiKey:String = try! Config.value(for: "API_KEY")
        switch self {
        case .getWeatherData(let latitude, let longitude):
            return "/forecast/\(apiKey)/\(latitude),\(longitude)"
        }
    }
}
