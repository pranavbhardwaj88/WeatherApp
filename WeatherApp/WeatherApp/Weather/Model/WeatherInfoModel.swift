//
//  WeatherResponse.swift
//  KlarnaWeatherApp
//
//  Created by Pranav Bhardwaj on 27/04/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

struct WeatherInfoModel: Codable {
    var latitude: Double?
    var longitude: Double?
    var timezone: String?
    var offset: Int
    
    var currently:CurrentWeatherInfoModel?
    var daily:WeatherInfoModel.List<DailyWeatherInfoModel>
    var hourly:WeatherInfoModel.List<HourlyWeatherInforModel>
    
}

extension WeatherInfoModel {
    
    struct List<T: Codable & Identifiable>: Codable {
        
        var list: [T]
        enum CodingKeys: String, CodingKey {
            
            case list = "data"
            
        }
        
    }
    
}
