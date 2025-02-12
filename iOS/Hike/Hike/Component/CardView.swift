//
//  CardView.swift
//  Hike
//
//  Created by Thiago Sena on 29/01/2025.
//

import SwiftUI

struct CardView: View {
	// MARK: - PROPERTIES
	@State private var imageNumber: Int = 1
	@State private var randomNumber: Int = 1
	@State private var isShowingSheet: Bool = false

	//MARK: - FUNCTIONS
	func randomImage(){
		repeat{
			randomNumber = Int.random(in: 1...5)
		} while randomNumber == imageNumber
		
		imageNumber = randomNumber
	}
	
    var body: some View {
		// MARK: - CARD
		
		ZStack {
			CustomBackgroundView()
			VStack {
				// MARK: - HEADER
				VStack(alignment: .leading) {
					HStack {
						Text("Hiking")
							.fontWeight(.black)
							.font(.system(size:52))
							.foregroundStyle(
								LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
						)
						
						Spacer()
						
						Button {
							// ACTION: Show a Sheet
							isShowingSheet.toggle()
						} label: {
							CustomButtonView()
						}
						.sheet(isPresented: $isShowingSheet) {
							SettingsView()
								.presentationDetents([.large])
								.presentationDragIndicator(.visible)
						}
					}
					
					Text("Fund and enjoyable ourdoor activities for friends and families.")
						.multilineTextAlignment(.leading)
						.italic()
						.foregroundColor(.customGrayMedium)
				} //: HEADER
				.padding(.horizontal, 30)
				// MARK: - MAIN CONTENT
				
				ZStack{
					CustomCircleView()
					Image("image-\(imageNumber)")
						.resizable()
						.scaledToFit()
						.animation(.easeOut(duration: 0.5), value: imageNumber)
				}
				
				// MARK: -FOOTER
				
				Button {
					// ACTION: Generate a random number
					randomImage()
					
				} label: {
					Text("Explore more.")
						.font(.title2)
						.fontWeight(.heavy)
						.foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
						.shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
				}
				.buttonStyle(GradientButton())
			}
		} //: CARD
		.frame(width: 320, height: 570)
	}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
