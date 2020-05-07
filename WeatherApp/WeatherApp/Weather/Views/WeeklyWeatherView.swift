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
        
         HStack(alignment: .center) {
            Text(viewModel.time)
            Spacer()
            HStack(spacing: 40) {
                viewModel.weatherIcon.icon
                .foregroundColor(viewModel.weatherIcon.iconColor)
                Text(viewModel.maxTemperature)
                Text(viewModel.minTemperature)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
