//
//  WildLifeEcosystem.swift
//  
//
//  Created by Jonathan Lee on 16/04/23.
//

import SwiftUI

struct WildLifeEcosystem: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle state
    @State var isLightOn: Bool = true
    @State var isWaveAnimated: Bool = false
    
    // Timer
    @State var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (colorScheme == .dark) {
                // Sky
                Image(uiImage: UIImage(named: "Stars")!)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
            }
            
            // Land and wildlife
            VStack(spacing: 0) {
                Spacer()
                
                // Wildlife
                HStack(alignment: .bottom, spacing: 0) {
                    // Moon
                    VStack {
                        if (colorScheme == .dark) {
                            Circle()
                                .fill(.white)
                                .frame(width: 80, height: 80)
                                .glow(color: colorScheme == .dark ? Color.brightHouse.opacity(0.5) : .clear, radius: 250)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 32)
                    .padding(.leading, 32)
                    
                    Spacer()
                    
                    // Turtle
                    VStack {
                        Text(isLightOn ? "Which one is the moon.." : "Oh, that is the real moon!")
                            .border(.red, width: 1)
                        
                        Image(uiImage: UIImage(named: "SeaTurtle")!)
                            .resizable()
                            .frame(width: 150, height: 50)
                            .scaleEffect(CGSize(width: isLightOn ? 1.0 : -1.0, height: 1.0))
                            .border(.red, width: 1)
                    }
                    .opacity(colorScheme == .dark ? 1.0 : 0)
                    .zIndex(1.0)
                    
                    Spacer()
                    
                    // Streetlight
                    StreetLight(poleSize: [14, 150], isLightOn: isLightOn)
                        .padding(.trailing, 64)
                }
                
                // Land
                ZStack {
                    HStack(alignment: .bottom, spacing: 0) {
                        // Sea land
                        ZStack(alignment: .bottomLeading) {
                            // Land
                            HStack(alignment: .bottom, spacing: 0) {
                                Rectangle()
                                    .fill(Color.land)
                                    .frame(width: 10, height: 200)
                                
                                RightTriangle()
                                    .fill(Color.land)
                                    .frame(width: 30, height: 200)
                            }
                            .zIndex(1.0)
                            
                            // Wave
                            HalfWave()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.seaTop, Color.seaBottom],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(maxWidth: .infinity, maxHeight: 160)
                                .offset(x: isWaveAnimated ? 0 : 15)
                                .offset(y: isWaveAnimated ? 0 : 10)
                                .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: isWaveAnimated)
                        }
                        .scaleEffect(CGSize(width: -1.0, height: 1.0))
                        
                        // Turtle land
                        Rectangle()
                            .fill(Color.land)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        
                        // Light land
                        Rectangle()
                            .fill(Color.land)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    }
                    
                    if (colorScheme == .light) {
                        Text("Please turn on dark mode for the full experiences :)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
        .onAppear() {
            isWaveAnimated = true
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                isLightOn.toggle()
            }
        }
    }
    
    func getWildLifeDescription() -> String {
        if (isLightOn && colorScheme == .dark) {
            return "Wait.., it’s day time already??\nI should wake up.."
        } else if (colorScheme == .light) {
            return "Wakey, wakey!\nIt’s day time already!"
        } else {
            return "Great! It’s night time already!\nTime to get some rest."
        }
    }
}


struct WildLifeEcosystem_Previews: PreviewProvider {
    static var previews: some View {
        WildLifeEcosystem()
    }
}
