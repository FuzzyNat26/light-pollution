//
//  ShieldedLights.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct ShieldedLights: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle binding
    @Binding var isShielded: Bool
    
    // Handle toggle state
    @State var isToggle: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Sky
            if (colorScheme == .dark) {
                RadialGradient(gradient: Gradient(colors: [
                    Color.houseGlowStart,
                    Color.houseGlowEnd.opacity(1.0),
                    Color.black.opacity(0.9)
                ]), center: .bottom, startRadius: 200, endRadius: UIScreen.screenHeight * 1)
                .ignoresSafeArea(.all)
                .opacity(isShielded ? 0.5 : 0.7)
            }
            
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                // Streetlight
                ShieldedStreetLight(
                    isLightOn: colorScheme == .dark ? .constant([true]) : .constant([false]),
                    isShielded: $isToggle,
                    clickable: true
                )
                
                // Land
                ZStack {
                    Rectangle()
                        .fill(Color.land)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    
                    if (colorScheme == .light) {
                        Text("Please turn on dark mode for the full experiences :)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    } else {
                        VStack {
                            HStack {
                                Text("Use shielded lights")
                                    .bold()
                                    .headingStyle()
                                    .foregroundColor(isShielded ? .green : nil)
                                    .multilineTextAlignment(.center)
                            }
                            
                            Toggle(isOn: $isToggle) {
                                Text("Use shielded lights")
                            }
                            .labelsHidden()
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
        .onChange(of: isToggle) { _ in
            isShielded = isToggle
            
            // Play sound
            AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
        }
    }
}

struct ShieldedLights_Previews: PreviewProvider {
    static var previews: some View {
        ShieldedLights(isShielded: .constant(true), isToggle: true)
    }
}
