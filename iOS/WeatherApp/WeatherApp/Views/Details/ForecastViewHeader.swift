//
//  ForecastViewDetails.swift
//  WeatherApp
//
//  Created by Thiago Sena on 14/01/2025.
//

import SwiftUI

struct ForecastViewHeader: View {
	
	@Binding var selection: Int
	
	var body: some View {
		VStack(spacing: 5){
			// MARK: Segmented Buttons
			HStack{
				Button {
						selection = 0
				} label: {
					Text("Hourly Forecast")
				}
				.frame(minWidth: 0, maxWidth: .infinity)
				
				Button {
					selection = 1
				} label: {
					Text("Weekly Forecast")
				}
				.frame(minWidth: 0, maxWidth: .infinity)
				
			}
			.font(.subheadline.weight(.semibold))
			.foregroundColor(.secondary)
			
			Divider()
				.background(.white.opacity(0.5))
				.blendMode(.overlay)
				.shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
				.blendMode(.overlay)
				.overlay{
					HStack{
						// MARK: Underline
						Divider()
							.frame(width: UIScreen.main.bounds.width/2, height: 3)
							.background(Color.underline)
							.blendMode(.overlay)
						
							// MARK: Underline Glow
							.overlay{
								RoundedRectangle(cornerRadius: 10)
									.foregroundColor(.white.opacity(0.5))
									.blur(radius: 17)
									.frame(width: UIScreen.main.bounds.width*0.4, height: 40)
									.blendMode(.overlay)
									.offset(y:-10)
								
							}
					}
					.frame(maxWidth:.infinity, alignment: selection == 0 ? .leading : .trailing)
					.offset(y:-1)
				}
		}
		.padding(.top,25)
		
	}
}

struct ForecastViewDetails_Previews: PreviewProvider {
    static var previews: some View {
		ForecastViewHeader(selection: .constant(0))
    }
}
