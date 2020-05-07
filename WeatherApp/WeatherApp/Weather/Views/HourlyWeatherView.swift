//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 04/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(viewModel.hourlyTemperatures) { data in
                    VStack (spacing: 16) {
                        Text(data.time)
                        Text(data.temperature)
                    }
                }
            }
            .frame(height: 60)
            .padding([.trailing, .leading])
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .padding([.top, .bottom])
    }
}
