//
//  SettingsView.swift
//  Hike
//
//  Created by Thiago Sena on 01/02/2025.
//

import SwiftUI

struct SettingsView: View {
	//MARK: - PROPERTIES
	private let alternateAppIcons: [String] = [
		"AppIcon-MagnifyingGlass",
		"AppIcon-Map",
		"AppIcon-Mushroom",
		"AppIcon-Camera",
		"AppIcon-Backpack",
		"AppIcon-Campfire"
	]
	
	//MARK: - FUNCTIONS
	
	var body: some View {
		List{
			// MARK: - SECTION: HEADER
			
			Section{
				HStack(alignment: .center){
					Spacer()
					Image(systemName: "laurel.leading")
						.font(.system(size:80, weight: .black))
					VStack(spacing: -10){
						Text("Hike")
							.font(.system(size:66,weight: .black))
						
						Text("Editors' Choice")
							.fontWeight(.medium)
					}
					Image(systemName: "laurel.trailing")
						.font(.system(size:80, weight: .black))
					Spacer()
				}
				.foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
				.padding(.top,8)
				
				VStack(spacing: 8){
					Text("Where you can find \nperfect tracks?")
						.font(.title2)
						.fontWeight(.heavy)
					
					Text("The hikes which looks gourgeous in photos but is even better once you are actually there. The hikes that you hope to do again someday. \nFind the best day hikes in the app.")
						.font(.footnote)
						.italic()
					
					Text("Dust off the boots! It's time for a walk.")
						.fontWeight(.heavy)
						.foregroundColor(.customGreenMedium)
				}
				.multilineTextAlignment(.center)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				
			}//: HEADER
			.listRowSeparator(.hidden)
			
			// MARK: - SECTION: ICONS
			Section(
				header: Text("ABOUT THE APP")
			){
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 12) {
						ForEach(alternateAppIcons.indices, id: \.self) { item in
							Button {
								print("icon \(alternateAppIcons[item]) pressed")
								
								UIApplication.shared.setAlternateIconName((alternateAppIcons[item])) {error in
									if error != nil {
										print("Failed request to update the app´s icon: \(String(describing: error?.localizedDescription))")
									} else{
										print("Sucess! You have changed the app´s icon to \(alternateAppIcons[item])")
									}
								}
							} label: {
								Image("\(alternateAppIcons[item])-Preview")
									.resizable()
									.scaledToFit()
									.frame(width: 80, height: 80)
									.cornerRadius(16)
							}
						.buttonStyle(.borderless)
						}
					}

				}//:SCROLL VIEW
				.padding(.top, 12)
				Text("Chosse your favorite app icon from the collection above.")
					.frame(minWidth:0,maxWidth:.infinity)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.font(.footnote)
					.padding(.bottom, 12)
			}//:SECTION
			.listRowSeparator(.hidden)
			
			// MARK: - SECTION: ABOUT
			Section(
				header: Text("ABOUT THE APP"),
				footer: HStack{
					Spacer()
					Text("Copyright © All rights Reserved | Thiago Sena")
					Spacer()
			
				}
					.padding(.vertical, 8)
			)
			{
				// 1. Basic Labeled Content
				LabeledContent("Aplication", value: "Hike")
				
				// 2. Advanced Labeled Content
				CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
				
				CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPad", rowTintColor: .red)
				
				CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
				
				CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
				
				CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Thiago Sena", rowTintColor: .mint)
				
				CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
				
				CustomListRowView(rowLabel: "Website",rowIcon: "globe", rowContent: nil, rowTintColor: .indigo, rowLinkLabel: "Thiago's Portfolio", rowLinkDestination: "https://www.thethiagosena.com")
			}
		}//: LIST
	}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
