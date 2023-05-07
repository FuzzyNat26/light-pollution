//
//  LightPollution.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct LightPollution: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle navigation
    @EnvironmentObject var navModel: NavigationModel
    
    // Handle slider
    @State var bortleScaleValue: Float = 6.0
    
    var body: some View {
        HStack(spacing: 0) {
            // Content
            ScrollView(showsIndicators: true) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("""
                    What is light?
                    
                    Light is simply a wave (called electromagnetic wave) that travels through your eyes! The light we see is what we called as **Visible Light**.
                    
                    Visible lights are useful for many use cases! Starting from lighting your room, displaying this playground on your screen, to the giant billboard that shines on the side of the road. We called those lights **Artificial Lights**.
                    
                    While it didn't seem bad to have those lights in our neighborhood, excessive and unnecessary artificial lights impacted our environment!
                    
                    This is why we called this phenomenon **Light Pollution**.
                    """)
                    .bodyStyle()
                    .padding(.bottom, 24)
                    
                    Text("Bortle Scale")
                        .bold()
                        .headingStyle()
                    
                    Text("""
                    We can measure light pollution in numerous ways. But one of them is **Bortle Scale**.
                    
                    **Bortle Scale** measures the quality of a night sky in a particular location, ranging from level 1 (clearest sky) to level 9 (most polluted).

                    For example, my current address in Batam, Indonesia has a Bortle scale of 6.
                    
                    Check out how Bortle scale works using the slider below!
                    """)
                    .bodyStyle()
                    .padding(.bottom, 24)
                    
                    Slider(value: $bortleScaleValue, in: 1...9, step: 1.0) {}
                    minimumValueLabel: {
                        Image(systemName: "sun.min.fill")
                    } maximumValueLabel: {
                        Image(systemName: "sun.max.fill")
                    }
                    .padding(.bottom, 32)
                    .disabled(colorScheme == .light)
                    
                    Button("Continue") {
                        navModel.nextPage()
                    }
                    .buttonStyle(PrimaryButton())
                    .padding(.bottom, 24)
                }
            }
            .padding(.horizontal, 20)
            .overlay(Divider(), alignment: .trailing)
            
            // Visual
            SkyGlow(bortleScaleValue: $bortleScaleValue, isSkyGlowComponent: false)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onChange(of: bortleScaleValue) { _ in
            // Play sound
            AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
        }
        .onDisappear() {
            AudioPlayer.shared.audioPlayer = nil
        }
    }
}

struct LightPollution_Previews: PreviewProvider {
    static var previews: some View {
        LightPollution()
    }
}
