//
//  GradienteButtonStyle.swift
//  Hike
//
//  Created by Thiago Sena on 29/01/2025.
//

import SwiftUI
import Foundation

struct GradientButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.padding(.vertical)
			.padding(.horizontal,30)
			.background(
				//Conditional Statemente with Nil Coalescing
				configuration.isPressed ?
				LinearGradient(colors: [.customGrayMedium , .customGrayLight], startPoint: .top, endPoint: .bottom)
				:
				LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
			)
			.cornerRadius(40)
	}
}
