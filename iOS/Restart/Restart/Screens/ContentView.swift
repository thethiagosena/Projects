//
//  ContentView.swift
//  Restart
//
//  Created by Thiago Sena on 04/02/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    var body: some View {
        ZStack {
            if isOnboardingViewActive{
                OnboardingView()
                    .transition(.asymmetric(
                        insertion: .scale.combined(with: .opacity),
                        removal: .move(edge: .trailing)))
            } else {
                HomeView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .opacity))
            }
        }.animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
