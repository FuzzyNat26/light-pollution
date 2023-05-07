//
//  Conclusion.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct Conclusion: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle navigation
    @EnvironmentObject var navModel: NavigationModel
    
    // Handle house light
    @State var turnHouseLight: Bool = true
    
    // Handle Wave
    @State var isWaveAnimated: Bool = false
    
    // Handle auto show
    @State var startStory: Bool = false // Light pollution is a phenomenon where excessive artificial lights affect our environments and dark natural sky.
    @State var secondStory: Bool = false // Light pollution can also have an impact to our environments, health, and wildlife.
    @State var thirdStory: Bool = false // By taking small steps a little by little, we can help to preserve the beauty of the sky, preserve our environments, and promote human health and well-being.
    @State var forthStory: Bool = false // That’s all for this playground, I hope you enjoyed it! 🌌
    
    @State var counter: Int = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        // Main
        ZStack(alignment: .center) {
            // Handle star and lights
            if (colorScheme == .dark) {
                Image(uiImage: UIImage(named: "Stars")!)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(turnHouseLight ? 0.5 : 1.0)
                
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
                            clickable: forthStory
                        )
                            .offset(x: -70)
                        
                        // Land
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.land)
                                .frame(width: 270, height: 190)
                            
                            if (forthStory && colorScheme == .dark) {
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
                                Human(turnHouseLight: $turnHouseLight, text: "I should turn off the lights!")
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
                        if (!forthStory && colorScheme == .dark) {
                            HStack {
                                Spacer()
                                
                                Button {
                                    withAnimation(.linear(duration: 0.5)) {
                                        if (thirdStory) {
                                            forthStory = true
                                            turnHouseLight = false
                                            timer.upstream.connect().cancel()
                                        } else if (secondStory) {
                                            thirdStory = true
                                            counter = 8
                                        } else if (startStory) {
                                            secondStory = true
                                            counter = 4
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
                        .bold()
                        .headingStyle()
                    Text("Please turn on dark mode for the full experiences :)")
                        .bodyStyle()
                        .multilineTextAlignment(.center)
                }
                // If dark mode
                else {
                    if (startStory) {
                        Text("Conclusion")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom)
                        
                        Text("""
                        Light pollution is a phenomenon where excessive artificial lights affect our environments and dark natural sky.
                        """)
                        .bodyStyle()
                        .padding(.bottom)
                    }
                    
                    if (secondStory) {
                        Text("""
                        Light pollution can also have an impact to our environments, health, and wildlife.
                        """)
                        .bodyStyle()
                        .padding(.bottom)
                    }
                    
                    if (thirdStory) {
                        Text("""
                        By taking small steps a little by little, we can help to preserve the beauty of the sky, preserve our environments, and promote human health and well-being.
                        """)
                        .bodyStyle()
                        .padding(.bottom)
                    }
                    
                    if (forthStory) {
                        Text("""
                        That’s all for this playground, I hope you enjoyed it! 🌌
                        """)
                        .bodyStyle()
                        .padding(.bottom)
                        
                        Button("Continue to Credits") {
                            navModel.credits()
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
                    switch(counter) {
                    case 0:
                        startStory = true
                    case 4:
                        secondStory = true
                    case 8:
                        thirdStory = true
                    case 12:
                        forthStory = true
                        turnHouseLight = false
                        timer.upstream.connect().cancel()
                    default:
                        break
                    }
                    
                    counter += 1
                }
            }
        }
        .navigationTitle("")
    }
}

struct Conclusion_Previews: PreviewProvider {
    static var previews: some View {
        Conclusion()
    }
}
