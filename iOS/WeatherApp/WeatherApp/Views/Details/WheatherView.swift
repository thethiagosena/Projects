//
//  WheatherView.swift
//  WeatherApp
//
//  Created by Thiago Sena on 15/01/2025.
//

import SwiftUI

struct WheatherView: View {
	
	@State private var searchText = ""
	
	var searchResults: [Forecast] {
		if searchText.isEmpty {
			return Forecast.cities
		} else {
			return Forecast.cities.filter {$0.location.contains(searchText)}
		}
	}
	
    var body: some View {
		ZStack{
			// MARK: Background
			Color.background
				.ignoresSafeArea()
			
			// MARK: Weather Widgets
			ScrollView(showsIndicators: false) {
				VStack(spacing: 20) {
					ForEach(searchResults){ forecast in
						WeatherWidget(forecast: forecast)
					}
				}
			}
			.safeAreaInset(edge: .top) {
				EmptyView()
					.frame(height: 110)
			}
		}
		.overlay{
			// MARK: Navigation Bar
			NavigationBar(searchText: $searchText)
			
		}
		.navigationBarHidden(true)
		//.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a City or Airport")
	}
}

struct WheatherView_Previews: PreviewProvider {
    static var previews: some View {
        WheatherView()
			.preferredColorScheme(.dark)
    }
}
