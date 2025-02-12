//
//  HomeView.swift
//  Restart
//
//  Created by Thiago Sena on 04/02/2025.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false

    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all, edges: .all)
            Color("ColorBlue").opacity(0.2)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack (spacing: 20){
                // MARK: - HEADER
                Spacer()
                ZStack {
                    CircleGroupView(ShapeColor: Color("ColorBlue"), ShapeOpacity: 0.3)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
                }
                .onAppear {
                    isAnimating=true
                }
                
                // MARK: - CENTER
                
                Text("The time that to mastery is dependet on the intensity of our focus")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // MARK: - FOOTER
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration:10)) {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }//: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)

            }
        }//: VSTACK
    }
}
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
