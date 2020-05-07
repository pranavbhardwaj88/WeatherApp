//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 04/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var viewModel: WeeklyTemperatureViewModel
    var body: some View {
        
        HStack(spacing: 16) {
            Text(viewModel.time)
            Spacer()
            Text(viewModel.maxTemperature)
            Spacer()
            Text(viewModel.minTemperature)
        }
        .frame(maxWidth: .infinity)
    }
}
