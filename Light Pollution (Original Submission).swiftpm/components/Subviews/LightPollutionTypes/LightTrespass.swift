//
//  LightTrespass.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct LightTrespass: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
//        // Light
//        RadialGradient(gradient: Gradient(colors: [
//            Color.houseGlowStart,
//            Color.houseGlowEnd.opacity(1.0),
//            Color.black.opacity(0.9)
//        ]), center: .bottom, startRadius: 300, endRadius: UIScreen.screenHeight * 2)
//        .ignoresSafeArea(.all)
//
        ZStack(alignment: .bottom) {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                
                HStack(alignment: .bottom) {
                    HalfHouse(
                        turnHouseLight: true,
                        otherHouseLight: true,
                        fill: AnyShapeStyle(
                            LinearGradient(
                                colors: [Color.streetLightOn.opacity(0.7), Color.house],
                                startPoint: .trailing,
                                endPoint: .leading
                            )
                        )
                    )
                        
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        // Description
                        if (colorScheme == .dark) {
                            Text("The lights from the neighbor's house \nare affecting this house")
                                .multilineTextAlignment(.trailing)
                                .padding(.trailing)
                        }
                        
                        // House
                        HalfHouse(
                            turnHouseLight: true,
                            otherHouseLight: true,
                            outsideLight: false,
                            fill: AnyShapeStyle(
                                LinearGradient(
                                    colors: [Color.streetLightOn.opacity(0.6), Color.house],
                                    startPoint: .topTrailing,
                                    endPoint: .bottomLeading
                                )
                            )
                        )
                            .scaleEffect(CGSize(width: -1.0, height: 1.0))
                    }
                }
                
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
                            Text("Light Trespass")
                                .bold()
                                .headingStyle()
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }

        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct LightTrespass_Previews: PreviewProvider {
    static var previews: some View {
        LightTrespass()
    }
}
