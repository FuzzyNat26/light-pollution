//
//  SkyGlow.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct SkyGlow: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Binding
    @Binding var bortleScaleValue: Float
    
    // Handle if this view are currently in used
    // in Light Pollution Types view
    var isSkyGlowComponent: Bool = true
    
    var body: some View {
        ZStack {
            if (colorScheme == .dark) {
                // Sky
                Image(uiImage: UIImage(named: "Stars")!)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .opacity(8 - Double(bortleScaleValue))
                
                ZStack {
                    // Light
                    RadialGradient(gradient: Gradient(colors: [
                        Color.houseGlowStart,
                        Color.houseGlowEnd.opacity(1.0),
                        Color.black.opacity(0.9)
                    ]), center: .bottom, startRadius: 300, endRadius: UIScreen.screenHeight * 2)
                    .ignoresSafeArea(.all)
                    .opacity(Double(bortleScaleValue) / 10.0)
                    .animation(.linear(duration: 0.5), value: bortleScaleValue)
                    
                    if (isSkyGlowComponent) {
                        Text("The glowing effect is caused by the reflection of light off particles in the sky such as dust and water.")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                    }
                }
            }
            
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                // Building
                City(bortleScaleValue: $bortleScaleValue)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                
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
                        if (isSkyGlowComponent) {
                            VStack {
                                Text("SkyGlow")
                                    .bold()
                                    .headingStyle()
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            VStack {
                                Text("Level \(Int(bortleScaleValue)) in Bortle Scale")
                                    .bold()
                                    .headingStyle()
                                    .multilineTextAlignment(.center)
                                
                                Text(setBortleDescription(bortleValue: bortleScaleValue))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
    }
    
    func setBortleDescription(bortleValue: Float) -> String {
        switch (bortleValue) {
        case 1.0:
            return "Excellent dark-sky site"
        case 2.0:
            return "Typical truly dark site"
        case 3.0:
            return "Rural sky"
        case 4.0:
            return "Rural/suburban transition"
        case 5.0:
            return "Suburban sky"
        case 6.0:
            return "Bright suburban sky"
        case 7.0:
            return "Suburban/urban transition"
        case 8.0:
            return "City sky"
        case 9.0:
            return "Inner-city sky"
        default:
            return "Something goes wrong..."
        }
    }
}

struct SkyGlow_Previews: PreviewProvider {
    static var previews: some View {
        SkyGlow(bortleScaleValue: .constant(9.0))
    }
}
