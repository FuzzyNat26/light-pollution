//
//  CircadianRhythm.swift
//  
//
//  Created by Jonathan Lee on 16/04/23.
//

import SwiftUI

struct CircadianRhythm: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle state
    @State var isLightOn: Bool = false
    
    // Timer
    @State var timer = Timer.publish(every: 7, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .bottom) {
                if (colorScheme == .dark) {
                    // Sky
                    Image(uiImage: UIImage(named: "Stars")!)
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .opacity(isLightOn ? 0.0 : 1.0)
                    
                    ZStack {
                        // Light
                        RadialGradient(gradient: Gradient(colors: [
                            Color.houseGlowStart,
                            Color.houseGlowEnd.opacity(1.0),
                            Color.black.opacity(0.9)
                        ]), center: .bottom, startRadius: 300, endRadius: UIScreen.screenHeight * 2)
                        .ignoresSafeArea(.all)
                        .opacity(isLightOn ? 0.9 : 0.0)
                    }
                }
                
                // Land and Building
                VStack(spacing: 0) {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        Human(
                            turnHouseLight: $isLightOn,
                            text: "",
                            scale: 2.0,
                            headLookUp: isLightOn && colorScheme == .dark,
                            fill: isLightOn && colorScheme == .dark
                                ? AnyShapeStyle(
                                    LinearGradient(
                                        colors: [Color.streetLightOn, Color.human],
                                        startPoint: .topTrailing,
                                        endPoint: .center
                                    )
                                ) : AnyShapeStyle(Color.human)
                        )
                        .zIndex(1.0)
                        
                        Spacer()
                        
                        // Streetlight
                        StreetLight(poleSize: [14, 150], isLightOn: isLightOn)
                            .padding(.trailing, 64)
                    }
                    .padding(.horizontal, 16)
                    
                    // Land
                    ZStack {
                        Rectangle()
                            .fill(Color.land)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        
                        if (colorScheme == .light) {
                            Text("Please turn on dark mode for the full experiences :)")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .background(Color.skyBlue)
            
            // Circadian Rhythm
            VStack(spacing: 8) {
                CircadianClock(isLightOn: $isLightOn, scale: 0.8)
                
                Text("Your body will feel like:")
                    .bold()
                    .headingStyle()
                
                Text(getCircadianDescription())
                    .bodyStyle()
                    .multilineTextAlignment(.center)
            }
            .offset(y: 100)
        }
        .edgesIgnoringSafeArea(.vertical)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                isLightOn.toggle()
            }
        }
    }
    
    func getCircadianDescription() -> String {
        if (isLightOn && colorScheme == .dark) {
            return "Wait.., it’s day time already??\nI should wake up.."
        } else if (colorScheme == .light) {
            return "Wakey, wakey!\nIt’s day time already!"
        } else {
            return "Great! It’s night time already!\nTime to get some rest."
        }
    }
}

struct CircadianRhythm_Previews: PreviewProvider {
    static var previews: some View {
        CircadianRhythm()
    }
}
