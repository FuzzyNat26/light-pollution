//
//  ShieldedStreetLight.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct ShieldedStreetLight: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Streetlight count
    var count: Int = 1
    
    // Streetlight configuration
    var poleSize: [CGFloat]
    var lightRadius: CGFloat
    @Binding var isShielded: Bool
    var directedLightGradient: Gradient
    
    // Others
    var isXrayActive: Bool
    var clickable: Bool
    var bulbList: [AnyView]
    @Binding var isLightOn: [Bool]
    
    init(count: Int = 1,
         poleSize: [CGFloat] = [14, 300],
         lightRadius: CGFloat = 72.0,
         isLightOn: Binding<[Bool]> = .constant(Array(repeating: false, count: 1)),
         isShielded: Binding<Bool> = .constant(false),
         directedLightGradient: Gradient = Gradient(colors: [Color.streetLightOn.opacity(0.7), Color.streetLightOn.opacity(0.0)]),
         isXrayActive: Bool = false,
         clickable: Bool = false,
         bulbList: [AnyView] = []
    ) {
        self.count = count
        self.poleSize = poleSize
        self.lightRadius = lightRadius
        self._isLightOn = isLightOn
        self._isShielded = isShielded
        self.directedLightGradient = directedLightGradient
        self.isXrayActive = isXrayActive
        self.clickable = clickable
        self.bulbList = bulbList
    }
    
    var body: some View {
        // Array of lights
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count)) {
            ForEach(0..<count, id: \.self) { element in
                ZStack(alignment: .top) {
                    // Main pole
                    VStack(alignment: .center, spacing: 0) {
                        // Light
                        ZStack(alignment: .bottom) {
                            // Circle
                            Circle()
                                .fill(isLightOn[element] ? Color.streetLightOn.opacity(isXrayActive ? 0.3 : 1.0) : Color.streetLightOff.opacity(isXrayActive ? 0.3 : 1.0))
                                .frame(width: lightRadius, height: lightRadius)
                                .glow(
                                    color: colorScheme == .dark &&
                                    !isShielded && isLightOn[element]
                                    ? Color.streetLightOn.opacity(0.1)
                                    : .clear, radius: 300)
                            
                            if (isXrayActive) {
                                bulbList[element]
                            }
                        }
                        
                        // Pole
                        Rectangle()
                            .fill(Color.cityTopOrder)
                            .frame(width: poleSize.first!, height: poleSize.last!)
                    }
                    
                    // Shielded and directed lights
                    if (isShielded) {
                        // Lights
                        VStack(alignment: .center, spacing: 0) {
                            // Cover
                            HalfCircle()
                                .fill(Color.streetLightCover)
                                .frame(width: lightRadius + 10, height: (lightRadius + 10) / 2)
                            
                            if (isLightOn[element]) {
                                // The directed lights
                                HStack(spacing: 0) {
                                    RightTriangle()
                                        .fill(
                                            .linearGradient(
                                                directedLightGradient,
                                                startPoint: .top,
                                                endPoint: .bottom))
                                        .frame(maxWidth: 80, maxHeight: .infinity)
                                        .scaleEffect(CGSize(width: -1.0, height: 1.0))
                                    
                                    Rectangle()
                                        .fill(
                                            .linearGradient(
                                                directedLightGradient,
                                                startPoint: .top,
                                                endPoint: .bottom))
                                        .frame(minWidth: lightRadius + 10, maxWidth: lightRadius + 10, minHeight: 0, maxHeight: .infinity)
                                    
                                    RightTriangle()
                                        .fill(
                                            .linearGradient(
                                                directedLightGradient,
                                                startPoint: .top,
                                                endPoint: .bottom))
                                        .frame(maxWidth: 80, maxHeight: .infinity)
                                }
                            }
                        }
                    }
                }
                .onTapGesture {
                    if (clickable && colorScheme == .dark) {
                        isLightOn[element].toggle()
                        isShielded.toggle()
                        
                        // Play sound
                        AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
                    }
                }
            }
        }
    }
}

struct ShieldedStreetLight_Previews: PreviewProvider {
    static var previews: some View {
        ShieldedStreetLight()
    }
}
