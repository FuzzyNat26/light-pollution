//
//  ReduceLights.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct ReduceLights: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme

    // Handle light count
    @State var light: Int = 4
    @State var houseInnerLight: Bool = true
    @State var houseOuterLight: [Bool] = [true, true]
    @State var houseLeftGardenLight: [Bool] = [true, true]
    @State var houseRightGardenLight: [Bool] = [true, true]
    
    // Handle state
    @Binding var isReduced: Bool

    var body: some View {
        ZStack {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                
                // House, fences, and lights
                HStack(alignment: .bottom, spacing: -30) {
                    // Fences and Lights
                    ZStack(alignment: .bottom) {
                        ShieldedStreetLight(
                            count: 2,
                            poleSize: [4, 65],
                            lightRadius: 18.5,
                            isLightOn: colorScheme == .dark ? $houseLeftGardenLight : .constant([false, false]),  // can change to binding
                            isShielded: .constant(true),
                            clickable: true
                        )
                        .padding(.horizontal)

                        Fence()
                    }
                    .frame(width: 130)
                    .zIndex(1.0)
                    
                    // House
                    House(
                        turnHouseLight: $houseInnerLight,
                        outsideLight: true,
                        isOutsideLightOn: $houseOuterLight,
                        clickable: true
                    )
                    
                    // Fences and Lights
                    ZStack(alignment: .bottom) {
                        ShieldedStreetLight(
                            count: 2,
                            poleSize: [4, 65],
                            lightRadius: 18.5,
                            isLightOn: colorScheme == .dark ? $houseRightGardenLight : .constant([false, false]),  // can change to binding
                            isShielded: .constant(true),
                            clickable: true
                        )
                        .padding(.horizontal)

                        Fence()
                    }
                    .frame(width: 130)
                    .zIndex(1.0)
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
                            Text("Reduce the lights")
                                .bold()
                                .headingStyle()
                                .foregroundColor(isReduced ? .green : nil)
                                .multilineTextAlignment(.center)
                            Text("Try use only 1 street light on each side and 2 inner house lights.")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
        .onChange(of: houseInnerLight ) { _ in
            setIsReduced()
        }
        .onChange(of: houseOuterLight ) { _ in
            setIsReduced()
        }
        .onChange(of: houseLeftGardenLight ) { _ in
            setIsReduced()
        }
        .onChange(of: houseRightGardenLight ) { _ in
            setIsReduced()
        }
    }
    
    func setIsReduced() {
        if
            houseInnerLight == true,
            houseOuterLight.allSatisfy({$0 == false}),
            houseLeftGardenLight.filter({$0 == true}).count == 1,
            houseRightGardenLight.filter({$0 == true}).count == 1
        {
            isReduced = true
        } else {
            isReduced = false
        }
    }
}

struct ReduceLights_Previews: PreviewProvider {
    static var previews: some View {
        ReduceLights(isReduced: .constant(true))
    }
}

