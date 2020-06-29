//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

enum WeatherAPI : NetworkRouter {
    case getWeatherData(latitude: Double, longitude:Double)
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherData:
            return .get
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

class WeatherServiceManager: NetworkService {
    
    class func getWeather(latitude: Double, longitude: Double, completion: @escaping (WeatherInfoModel) -> Void) {
        
        request(type: WeatherInfoModel.self, router: WeatherAPI.getWeatherData(latitude: latitude, longitude: longitude), completion: { (result) in
            switch result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print("Network Error: \(error)")
            }
        })
    }
}

