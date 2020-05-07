//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

class WeatherServiceManager: NetworkService {
    
    class func getWeather(latitude: Double, longitude: Double, completion: @escaping (WeatherInfoModel?, String?) -> Void) {
        
        request(type: WeatherInfoModel.self, router: .getWeatherData(latitude: latitude, longitude: longitude), completion: { (response) in
            if let error = response.error {
                completion(nil, error.localizedDescription)
            } else if let responseObject = response.responseObject{
                completion(responseObject, nil)
            } else {
                completion(nil, "No data")
            }
        })
    }
}

