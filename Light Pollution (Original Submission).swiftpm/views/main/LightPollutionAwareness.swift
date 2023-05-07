//
//  LightPollutionAwareness.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct LightPollutionAwareness: View {
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
                    Okay.. It’s just some inconvenience. Why we must make a fuse about it?

                    Turns out, it causes more problem than just disrupting our sky views. Here are some of them!
                    """)
                        .bodyStyle()
                        .padding(.bottom, 24)
                    
                    // Health Impacts
                    Group {
                        Text("Health Impacts")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        Most living organisms depends on a natural clocks that cycles through day and night for survival, commonly known as **Circadian Rhythm**.   This rhythm influenced hormones. One of which is called **Melatonin Hormone**, which help us from sleep until fighting cancers.

                        Studies show that exposure to excessive light affects our circadian rhythm, which decreases the production of the melatonin hormone. This is linked to sleep disorders, fatigue, and also an increased risk of cancer.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    // Wildlife and Ecosystems
                    Group {
                        Text("Wildlife and Ecosystems")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        By introducing artificial lights on the ecosystems, it affects animals’ migration, breeding cycles, and more!

                        One example can be found on sea turtle hatchlings. They often confuse our artificial lights with the moon, causing them to head to the wrong direction (away from ocean). This makes them more vulnerable.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    // Wasting Money and Energy
                    Group {
                        Text("Wasting Money and Energy")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        Excessive use of lights that are not needed requires a considerable amount of energy to power them up, which not only harms the environment but also has economic effects.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 32)
                    }
                    
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
            TabView {
                CircadianRhythm()
                
                WildLifeEcosystem()
                
                WastingEnergy()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.skyBlue)
            .edgesIgnoringSafeArea(.vertical)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onDisappear() {
            AudioPlayer.shared.audioPlayer = nil
        }
    }
}

struct LightPollutionAwareness_Previews: PreviewProvider {
    static var previews: some View {
        LightPollutionAwareness()
    }
}
