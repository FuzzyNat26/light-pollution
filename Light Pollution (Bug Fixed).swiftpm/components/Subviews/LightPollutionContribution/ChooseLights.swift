//
//  ChooseLights.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct ChooseLights: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle binding
    @Binding var isLightCorrect: Bool
    
    // Handle state
    @State var isSelected: [Bool] = [false, false, false]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Sky
            if (colorScheme == .dark) {
                RadialGradient(gradient: Gradient(colors: [
                    Color.houseGlowStart,
                    Color.houseGlowEnd.opacity(1.0),
                    Color.black.opacity(0.9)
                ]), center: .bottom, startRadius: 200, endRadius: UIScreen.screenHeight * 1)
                .ignoresSafeArea(.all)
//                .opacity(isShielded ? 0.5 : 0.7)
            }
            
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
 
                // Text
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    Text("Incandescent")
                        .bold()
                    Text("CFL")
                        .bold()
                    Text("LED")
                        .bold()
                }
                .padding(.bottom)
                
                // Streetlight
                ShieldedStreetLight(
                    count: 3,
                    poleSize: [15, 200],
                    isLightOn: colorScheme == .dark ? $isSelected : .constant(Array(repeating: false, count: 3)),
                    isShielded: .constant(true),
                    isXrayActive: true,
                    clickable: true,
                    bulbList: [
                        AnyView(Incandescent(scale: 0.5, isSelected: isSelected[0])),
                        AnyView(CFL(scale: 0.5, isSelected: isSelected[1])),
                        AnyView(LED(scale: 0.5, isSelected: isSelected[2])),
                    ]
                )
                
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
                            Text("Turn on the recommended lights!")
                                .bold()
                                .headingStyle()
                                .foregroundColor(isLightCorrect ? .green : nil)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
        .onChange(of: isSelected) { _ in
            isLightCorrect = isSelected == [false, true, true]
        }
    }
}

struct ChooseLights_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLights(isLightCorrect: .constant(true))
    }
}
