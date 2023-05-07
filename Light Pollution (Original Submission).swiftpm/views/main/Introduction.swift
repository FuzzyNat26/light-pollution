//
//  Introduction.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct Introduction: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle navigation
    @EnvironmentObject var navModel: NavigationModel
    
    // Handle house light
    @State var turnHouseLight: Bool = false
    
    // Handle Wave
    @State var isWaveAnimated: Bool = false
    
    // Handle auto show
    @State var startStory: Bool = false
    @State var secondStory: Bool = false
    
    @State var counter: Int = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        // Main
        ZStack(alignment: .center) {
            // Handle star and lights
            if (colorScheme == .dark) {
                // Stars
                Image(uiImage: UIImage(named: "Stars")!)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(turnHouseLight ? 0.5 : 1.0)
                
                // Glowing effect
                if (turnHouseLight) {
                    RadialGradient(gradient: Gradient(colors: [
                        Color.houseGlowStart,
                        Color.houseGlowEnd.opacity(0.9),
                        Color.black.opacity(0.9)
                    ]), center: .bottomLeading, startRadius: 100, endRadius: UIScreen.screenHeight * 3)
                }
            }
            
            // Handle background views
            VStack {
                // Push views to the ground (house, land, piers, and wave)
                Spacer()
                
                HStack(alignment: .bottom, spacing: -50) {
                    // Land and House
                    VStack(alignment: .leading, spacing: 0) {
                        // House
                        House(
                            turnHouseLight: $turnHouseLight,
                            isOutsideLightOn: .constant([true, true]),
                            clickable: secondStory
                        )
                            .offset(x: -70)
                        
                        // Land
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.land)
                                .frame(width: 270, height: 190)
                            
                            if (secondStory && colorScheme == .dark) {
                                Text("P.S. You can tap on the house!")
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                    
                    // Piers and wave
                    ZStack(alignment: .bottomLeading) {
                        RightTriangle()
                            .fill(Color.land)
                            .frame(width: 60, height: 190)
                            .zIndex(1)
                        
                        // Piers
                        VStack(spacing: 0) {
                            // Human
                            if (colorScheme == .dark) {
                                Human(turnHouseLight: $turnHouseLight, text: "Where are all those things go?")
                            }
                            
                            // Piers
                            Pier()
                        }
                        // Wave
                        Wave()
                            .fill(
                                LinearGradient(
                                    colors: [Color.seaTop, Color.seaBottom],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .offset(x: isWaveAnimated ? 0 : 35)
                            .offset(y: isWaveAnimated ? 0 : 10)
                            .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: isWaveAnimated)
                        
                        // Skip button
                        if (!secondStory && colorScheme == .dark) {
                            HStack {
                                Spacer()
                                
                                Button {
                                    withAnimation(.linear(duration: 0.5)) {
                                        if (!startStory) {
                                            startStory = true
                                        } else {
                                            secondStory = true
                                            turnHouseLight = true
                                            timer.upstream.connect().cancel()
                                        }
                                    }
                                } label: {
                                    Text("Skip")
                                }
                                .buttonStyle(SmallPrimaryButton())
                                .offset(x: -20, y: -20)
                            }
                        }
                    }
                }
            }
            
            // Handle text content
            VStack(alignment: colorScheme == .light ? .center : .leading, spacing: 16) {
                // If light mode
                if (colorScheme == .light) {
                    Text("Hi There!")
                        .headingStyle()
                    Text("Please turn on dark mode for the full experiences :)")
                        .bodyStyle()
                        .multilineTextAlignment(.center)
                }
                // If dark mode
                else {
                    if (startStory) {
                        Text("Let's start with a simple question.")
                        
                        HStack {
                            Rectangle()
                                .fill(.white)
                                .frame(width: 5, height: 20)
                            Text("_What is a space?_")
                                .bold()
                                .headingStyle()
                        }
                        
                        Text("""
                        Some might say “a three-dimensional zone”. Others might say “a place outside of earth”.

                        They are all correct! But for me, space is a ✨ magical place ✨.

                        A place where shining, shimmering, and splendid (pun intended) stars are. A place where the moon chased me whenever I look up to the sky. A place where people say your wish will come true!
                        """)
                        .bodyStyle()
                        .padding(.bottom)
                    }
                    
                    if (secondStory) {
                        Text("""
                        Those little bright dots are scattered everywhere, but not as much as it’s used to be.
                        
                        In this playground, let’s learn about this phenomenon together! Why it is important for me, for the environments, and for the world.
                        
                        Notes: It not just about stars! 😉
                        """)
                        .bodyStyle()
                        
                        Button("Continue") {
                            navModel.nextPage()
                        }
                        .buttonStyle(PrimaryButton())
                        .padding(.bottom)
                    }
                    
                    Spacer()
                }
            }
            .frame(width: 500, alignment: colorScheme == .light ? .center : .leading)
            .padding(.vertical, 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(Color.skyBlue)
        .onAppear() {
            withAnimation {
                isWaveAnimated = true
            }
        }
        .onReceive(timer) { timerInput in
            withAnimation(.linear(duration: 0.5)) {
                if colorScheme == .dark {
                    if (counter == 8) {
                        secondStory = true
                        turnHouseLight = true
                        timer.upstream.connect().cancel()
                    }
                    else {
                        startStory = true
                    }
                    
                    counter += 1
                }
            }
        }
        .navigationTitle("")
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
