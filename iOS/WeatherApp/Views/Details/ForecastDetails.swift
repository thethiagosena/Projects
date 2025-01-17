//
//  ForecastDetails.swift
//  WeatherApp
//
//  Created by Thiago Sena on 15/01/2025.
//

import SwiftUI

struct ForecastDetails: View {
	@Binding var selection:Int
	
	var body: some View {
		// MARK: Forecast Cards
		ScrollView(.horizontal, showsIndicators: false)
		{
			HStack(spacing: 12){
				if selection == 0  {
					ForEach(Forecast.hourly){ forecast in
						ForecastCard(forecast: forecast, forecastPeriod: .hourly)
					}
					.transition(.offset(x:-430))
				} else {
					ForEach(Forecast.daily){ forecast in
						ForecastCard(forecast: forecast, forecastPeriod: .daily)
					}
					.transition(.offset(x:430))
				}
			}
			.padding(.vertical, 15)
		}
		.padding(.horizontal, 20)
		
		// MARK: Forecast Widgets
		Image("Forecast Widgets")
			.opacity(ForecastViewBackground().bottomSheetTranslationProrated)
	}
}

struct ForecastDetails_Previews: PreviewProvider {
    static var previews: some View {
		ForecastDetails(selection: .constant(1) )
    }
}
