//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation
import CoreLocation
//Pranav
import Combine

class LocationManager: NSObject {
    
    var currentLocation: ((_ :CLLocation, _:String) -> Void)?
    lazy var geocoder = CLGeocoder()
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func startLocationService() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopLocationService() {
        self.locationManager.stopUpdatingLocation()
    }
    
}

extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        var cityName = ""
        geocoder.reverseGeocodeLocation(location) { (placemarker, _) in
            cityName = placemarker?.first?.locality ?? ""
            self.currentLocation?(location, cityName)
        }
        //currentLocation?(location, cityName)
        self.stopLocationService()
    }
}
