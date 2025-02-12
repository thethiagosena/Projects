//
//  CustomCircleView.swift
//  Hike
//
//  Created by Thiago Sena on 29/01/2025.
//

import SwiftUI

struct CustomCircleView: View {
	@State private var isAnimateGradient: Bool = false
	
	
	
	var body: some View {
		ZStack {
			Circle()
				.fill(
					LinearGradient(colors: [
						Color.customIndigoMedium,
						Color.customSalmonLight
					],
				   startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
								endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing))
				.onAppear{
					withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
						isAnimateGradient.toggle()
					}}
			.frame(width: 256, height: 256)
			MotionAnimationView()
		}//:ZStack
		.frame(width: 256, height: 256)
	}
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
