//
//  Onboarding.swift
//  
//
//  Created by Jonathan Lee on 18/04/23.
//

import SwiftUI

struct Onboarding: View {
    // Handle colorscheme
    @AppStorage("colorScheme") var colorScheme: DeviceColorScheme = .system
    
    // Handle colorscheme
    @AppStorage("firstTimeUser") var firstTimeUser: Bool = true
    
    var body: some View {
        VStack {
            Text("Before we start, it is recommended to use Dark Mode to simulate a **Dark Sky**. You can overwrite the appearance inside the playground's settings.")
                .headingStyle()
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            
            Button("Continue") {
                firstTimeUser = false
            }
            .buttonStyle(PrimaryButton())
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: 700, maxHeight: .infinity)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
