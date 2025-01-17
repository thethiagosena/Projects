//
//  HomeView.swift
//  WeatherApp
//
//  Created by Thiago Sena on 12/01/2025.
//


import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable{
//	case top = 0.83 // 702/844 (sheet height / screen height)
//	case middle = 0.385 // 325/844 (sheet height / screen height)
	case top
	case middle
	case small
	
	public var size: CGFloat {
		switch self {
		case .top: return {UIScreen.main.bounds.height * 0.9}()
		case .middle: return {UIScreen.main.bounds.height * 0.5}()
		case .small: return {UIScreen.main.bounds.height * 0.2}()
		}
	}
}


struct HomeView: View {

    @State var isPresented = true
    @State var isSheetOnTop: Bool = false
	@State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
	@State var bottomSheetPosition: BottomSheetPosition = .middle
	var bottomSheetTranslationProrated: CGFloat {
		(bottomSheetTranslation - BottomSheet.PresentationDetent.medium.size) / (BottomSheet.PresentationDetent.large.size - BottomSheet.PresentationDetent.medium.size)
	}
    @State var presentationDetent: BottomSheet.PresentationDetent = .medium
	@State var hasDragged: Bool = false
	@State var selection:Int = 0

	        
    var body: some View {
        NavigationView {
			GeometryReader {geometry in
				let screenHeight = geometry.size.height
				+ geometry.safeAreaInsets.top
				+ geometry.safeAreaInsets.bottom
				
				let imageOffset = screenHeight + 36
				
				ZStack{
					// MARK: Background Colour
					Color.background
						.ignoresSafeArea()
					
					// MARK: Background Image
					Image("Background")
						.resizable()
						.ignoresSafeArea()
						.offset(y: (bottomSheetTranslationProrated>0) ?  -bottomSheetTranslationProrated * imageOffset : 0)
					
					// MARK: House Image
					Image("House")
						.frame(maxHeight: .infinity, alignment: .top)
						.padding(.top, 257)
						.offset(y: (bottomSheetTranslationProrated>0) ?  -bottomSheetTranslationProrated * imageOffset : 0)
					
					// MARK: Temperature and Infos
					VStack(spacing: -10 * (1-bottomSheetTranslationProrated)){
						Text("Montreal")
							.font(.largeTitle)
						VStack{
							Text(attributeString)
							
							Text("H24º    L:18º")
								.font(.title3.weight(.semibold))
								.opacity(1-bottomSheetTranslationProrated)
							
							Spacer()
						}
					}
					.padding(.top, 51)
					.offset(y: 46 * -bottomSheetTranslationProrated)
					
					
					// MARK: Bottom Sheet
					.sheetPlus(
						isPresented: $isPresented,
						background: (
//							Color(.red).cornerRadius(12).opacity(0.2)
							ForecastViewBackground(bottomSheetTranslationProrated: bottomSheetTranslationProrated)

						),
						onDrag: { translation in
//							print(translation)
							bottomSheetTranslation = translation
							isSheetOnTop = presentationDetent == .large ? true: false
							
							withAnimation(.easeInOut){
								hasDragged = bottomSheetTranslationProrated == 1 ? true: false
							}

						},
						header: {
							ForecastViewHeader(selection: $selection).offset(y:-25)
//							ForecastViewHeader()
//							Text(bottomSheetTranslationProrated.formatted() + (isSheetOnTop ? " - TOP" : " - MEDIO"))
//								.padding(.top, -50)

						},
						main: {
							ForecastDetails(selection: $selection)
								.presentationDetentsPlus(
									[.medium, .large],
									selection: $presentationDetent
								)
								.presentationDragIndicatorPlus(.visible)
								.presentationBackgroundInteractionPlus(.enabled(upThrough: .height(380)))
								
						}
					)
					// MARK: Tab Bar
				   
					TabBar(action:{
						isSheetOnTop.toggle()
						presentationDetent = isSheetOnTop ? .large : .medium
					})
					.offset(y: (bottomSheetTranslationProrated>0) ?  bottomSheetTranslationProrated * 155 : 0)
				}
			}
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    private var attributeString: AttributedString {
		var string = AttributedString("19º" + (hasDragged ? " | " : "\n ") + "Mostly Clear")
        
        if let temp = string.range(of: "19º"){
			string[temp].font = .system(size:(96 - (bottomSheetTranslationProrated*(96-20))), weight: hasDragged ? .semibold : .thin)
			string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
			string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
            
        }
        
        return string
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
            .preferredColorScheme(.dark)
    }
}
