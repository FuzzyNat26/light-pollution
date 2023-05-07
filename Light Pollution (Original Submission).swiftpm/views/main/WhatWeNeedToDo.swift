//
//  WhatWeNeedToDo.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct WhatWeNeedToDo: View {    
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle navigation
    @EnvironmentObject var navModel: NavigationModel
    
    // Handle slider
    @State var bortleScaleValue: Float = 6.0
    
    // Handle state
    @State var isShielded: Bool = false
    @State var isLightCorrect: Bool = false
    @State var isLightTemperatureAccepted: Bool = false
    @State var isReduced: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            // Content
            ScrollView(showsIndicators: true) {
                VStack(alignment: .leading, spacing: 8) {   
                    Text("""
                    We can contribute to that with just some simple things!
                    """)
                    .padding(.bottom, 24)
                    
                    HStack(alignment: .top) {
                        Text("**1.**")
                        Text("""
                        **Reduced the amount of lights**
                        You can turn off your lights when it’s not needed. Motion sensors also can help prevent forgetfulness of turning off your lights!
                        """)
                        .bodyStyle()
                    }
                    .padding(.bottom, 24)
                    
                    HStack(alignment: .top) {
                        Text("**2.**")
                        Text("""
                        **Shielded / Directed lights**
                        You can shield and direct your light to the only place that you want. It will reduce the illumination levels around and minimizing light trespass.
                        """)
                        .bodyStyle()
                    }
                    .padding(.bottom, 24)
                    
                    HStack(alignment: .top) {
                        Text("**3.**")
                        Text("""
                        **LEDs and CFLs**
                        As LEDs and CFLs lights are more power-efficient, it can reduce the wasted energy. Warm colored LED bulbs are actually recommended by International Dark-Sky Association.
                        """)
                        .bodyStyle()
                    }
                    .padding(.bottom, 24)
                    
                    HStack(alignment: .top) {
                        Text("**4.**")
                        Text("""
                        **Avoid blue lights**
                        Blue lights are known to increase glare and also affect wildlife behaviours. It is recommended to have light with color temperature below 3000K.
                        """)
                        .bodyStyle()
                    }
                    .padding(.bottom, 24)
                    
                    Text("Continue to the next part by completing the tasks! You can click on the lights, toggle, and also drag the slider.")
                        .padding(.bottom, 32)
                    
                    
                    Button("Continue \([isShielded, isLightTemperatureAccepted, isLightCorrect, isReduced].filter{ $0 }.count)/4") {
                        navModel.nextPage()
                    }
                    .buttonStyle(PrimaryButton())
                    .padding(.bottom, 24)
                    .disabled(!isShielded || !isLightTemperatureAccepted || !isLightCorrect || !isReduced)
                }
            }
            .padding(.horizontal, 20)
            .overlay(Divider(), alignment: .trailing)
            
            // Visual
            TabView {
                ReduceLights(isReduced: $isReduced)
                // Shielded / Directed Lights
                ShieldedLights(isShielded: $isShielded)
                
                // LEDs and CFLs
                ChooseLights(isLightCorrect: $isLightCorrect)
                
                // Avoid Blue Lights
                BlueLights(isLightTemperatureAccepted: $isLightTemperatureAccepted)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.skyBlue)
            .edgesIgnoringSafeArea(.vertical)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onDisappear() {
            AudioPlayer.shared.audioPlayer = nil
        }
        .onChange(of: isReduced) { _ in
            playSound(from: isReduced)
        }
        .onChange(of: isShielded) { _ in
            playSound(from: isShielded)
        }
        .onChange(of: isLightCorrect) { _ in
            playSound(from: isLightCorrect)
        }
        .onChange(of: isLightTemperatureAccepted) { _ in
            playSound(from: isLightTemperatureAccepted)
        }
    }
    
    func playSound(from boolean: Bool) {
        // Play sound
        if (boolean) {
            if (isShielded && isReduced && isLightCorrect && isLightTemperatureAccepted) {
                AudioPlayer.shared.playSoundFromPath(name: "correct-all", type: "mp3")
            } else {
                AudioPlayer.shared.playSoundFromPath(name: "correct", type: "mp3")
            }
        }
    }
}
    

struct WhatWeNeedToDo_Previews: PreviewProvider {
    static var previews: some View {
        WhatWeNeedToDo()
    }
}
