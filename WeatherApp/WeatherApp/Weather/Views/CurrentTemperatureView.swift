//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 04/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import SwiftUI

struct CurrentTemperatureView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(viewModel.cityName)
                .font(.largeTitle)
            Text(viewModel.currentTemperature)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(viewModel.currentWeatherSummary)
                .font(.body)
            Text(viewModel.currentDay)
                .font(.body)
        }
        .frame(maxWidth: .infinity)
    }
}

