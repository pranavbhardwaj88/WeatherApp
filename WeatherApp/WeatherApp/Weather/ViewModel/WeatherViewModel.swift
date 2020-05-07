//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var locationManager: LocationManager!
    @Published var weatherData: WeatherInfoModel?
    @Published var loading = false
    @Published var cityName = ""
    
    let didChange = PassthroughSubject<WeatherViewModel,Never>()
    
    var currentTemperature : String {
        guard let temperature = self.weatherData?.currently?.temperature else {
            return "--ºF"
        }
        return temperature.temperatureString()
    }
    
    var currentWeatherSummary: String {
        guard let summary = self.weatherData?.currently?.summary else {
            return ""
        }
        return summary
    }
    
    var currentDay: String {
        guard let time = self.weatherData?.currently?.time else {
            return ""
        }
        return "\(Date(timeIntervalSince1970: time).formattedDay)  Today"
    }
    
    var timeZone: String {
        return self.weatherData?.timezone ?? ""
    }
    
    var hourlyTemperatures = [HourlyTemperatureViewModel]()  {
        didSet {
            didChange.send(self)
        }
    }
    
    var weeklyTemperatures = [WeeklyTemperatureViewModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var weatherIcon: WeatherIcon {
        guard let icon = self.weatherData?.currently?.icon else {
            return WeatherIcon.clearDay
        }
        
        return WeatherIcon.init(rawValue: icon) ?? WeatherIcon.clearDay
    }
    
    init() {
        getWeatherData()
    }
    
    private func getWeatherData() {
        self.loading = true
        locationManager = LocationManager.init()
        locationManager.startLocationService()
        locationManager.currentLocation = { location, cityName in
            DispatchQueue.main.async {
                self.cityName = cityName
            }
            WeatherServiceManager.getWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { (data, error) in
                if let weatherData = data {
                    self.hourlyTemperatures = weatherData.hourly.list.map(HourlyTemperatureViewModel.init)
                    self.weeklyTemperatures = weatherData.daily.list.map(WeeklyTemperatureViewModel.init)
                    DispatchQueue.main.async {
                        self.weatherData = weatherData
                        self.loading = false
                    }
                }
            }
        }
    }
}
