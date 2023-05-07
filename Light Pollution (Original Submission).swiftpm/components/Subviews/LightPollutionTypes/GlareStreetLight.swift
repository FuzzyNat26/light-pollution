//
//  GlareStreetLight.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct GlareStreetLight: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                HStack(alignment: .bottom) {
                    Human(
                        turnHouseLight: .constant(true),
                        text: "This light is so \nbright! It's hurting my eyes...",
                        scale: 2.0, fill: AnyShapeStyle(
                            LinearGradient(
                                colors: [Color.streetLightOn, Color.human],
                                startPoint: .topTrailing,
                                endPoint: .center
                            )
                        )
                    )
                    .zIndex(1.0)
                    .opacity(colorScheme == .dark ? 1.0 : 0)
                    
                    Spacer()
                    
                    // Streetlight
                    StreetLight()
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
                    } else {
                        VStack {
                            Text("Glare")
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

struct GlareStreetLight_Previews: PreviewProvider {
    static var previews: some View {
        GlareStreetLight()
    }
}
