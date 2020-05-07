//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        NavigationView {
            List {
                CurrentTemperatureView(viewModel: viewModel)
                    .frame(height: 160)
                
                if viewModel.hourlyTemperatures.count > 0 {
                    HourlyWeatherView(viewModel: viewModel)
                }
                
                if viewModel.weeklyTemperatures.count > 0 {
                    Section(header:
                        HStack(alignment: .center) {
                           Text("This week")
                            .font(.headline)
                            Spacer()
                            Spacer()
                            Text("Max")
                            .font(.headline)
                            Spacer()
                            Text("Min")
                            .font(.headline)
                        }
                    ) {
                        ForEach(viewModel.weeklyTemperatures) { model in
                            WeeklyWeatherView(viewModel: model)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Weather"))
        }
    }
}
