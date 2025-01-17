//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Thiago Sena on 12/01/2025.
//

import SwiftUI

struct ForecastViewBackground: View {
	
	var bottomSheetTranslationProrated: CGFloat = 1

    var body: some View {
        ScrollView{
			
        }
        .background(Color.bottomSheetBackground)
        //.background(Blur(radius: 25, opaque: true))
        .backgroundBlur(radius: 25, opaque: true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur:0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
//        .overlay{
//            // MARK: Bottom Sheet Inner Shadow (Border)
//            RoundedRectangle(cornerRadius: 44)
//                .stroke(Color.bottomSheetBorderMiddle, lineWidth: 1)
//                .blendMode(.overlay)
//                .offset(y:1)
//                .blur(radius: 0)
//                .mask{
//                RoundedRectangle(cornerRadius: 44)
//                }
//        }
        .overlay{
        // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        // MARK: Drag Indicator
        // Drag button. It is off because the new bottom sheet package already has one and works different from the original taught on YT video tutorial
//        .overlay{
//            RoundedRectangle(cornerRadius: 10)
//                .fill(.black.opacity(0.3))
//                .frame(width: 48, height: 5)
//                .frame(height: 20)
//                .frame(maxHeight: .infinity, alignment: .top)
//        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastViewBackground()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
