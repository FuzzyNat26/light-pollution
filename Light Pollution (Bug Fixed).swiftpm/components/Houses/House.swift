//
//  House.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct House: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle inside lights
    @Binding var turnHouseLight: Bool
    
    // Handle outside lights
    var outsideLight: Bool = false
    
    // Handle state
    @Binding var isOutsideLightOn: [Bool]
    var clickable: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Triangle()
                .fill(
                    turnHouseLight && colorScheme == .dark
                    // If light have turned on
                    ? Color.brightHouse
                    // Else
                    : Color.house
                )
                .zIndex(1)
                .frame(width: outsideLight ? 360 : 320, height: 130)
                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 10)
            ZStack {
                HStack(alignment: .top) {
                    // Light
                    if (outsideLight) {
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(Color.bottomWood)
                                .frame(width: 5, height: 5)
                            
                            Circle()
                                .fill(isOutsideLightOn[0] ? Color.streetLightOn : Color.streetLightOff)
                                .frame(width: 25, height: 25)
                                .glow(color: colorScheme == .dark && isOutsideLightOn[0] ? Color.brightHouse.opacity(0.5) : .clear, radius: 250)
                                .zIndex(2.0)
                        }
                        .onTapGesture {
                            if (clickable && colorScheme == .dark) {
                                isOutsideLightOn[0] = !isOutsideLightOn[0]
                                
                                // Play sound
                                AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
                            }
                        }
                        .padding(.leading, 4)
                    }
                    
                    // House
                    Rectangle()
                        .fill(
                            turnHouseLight && colorScheme == .dark
                            // If light have turned on
                            ? Color.brightHouse
                            // Else
                            : Color.house
                        )
                    .frame(width: 260, height: 130)
                    
                    // Light
                    if (outsideLight) {
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(Color.bottomWood)
                                .frame(width: 5, height: 5)
                            
                            Circle()
                                .fill(isOutsideLightOn[1] ? Color.streetLightOn : Color.streetLightOff)
                                .frame(width: 25, height: 25)
                                .glow(color: colorScheme == .dark && isOutsideLightOn[1] ? Color.brightHouse.opacity(0.5) : .clear, radius: 250)
                                .zIndex(2.0)
                        }
                        .onTapGesture {
                            if (clickable && colorScheme == .dark) {
                                isOutsideLightOn[1] = !isOutsideLightOn[1]
                                
                                // Play sound
                                AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
                            }
                        }
                        .padding(.leading, 4)
                    }
                }
                HStack(spacing: 40) {
                    Rectangle()
                        .fill(colorScheme == .dark && turnHouseLight ? Color.houseLightOn : Color.houseLightOff)
                        .frame(width: 25, height: 60)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(colorScheme == .dark && turnHouseLight ? Color.houseLightOn : Color.houseLightOff)
                        .frame(width: 25, height: 60)
                        .cornerRadius(4)
                }
            }
        }
        .onTapGesture {
            withAnimation {
                if (clickable && colorScheme == .dark) {
                    turnHouseLight.toggle()
                    
                    // Play sound
                    AudioPlayer.shared.playSoundFromPath(name: "light-click", type: "mp3")
                }
            }
        }
    }
}

struct House_Previews: PreviewProvider {
    static var previews: some View {
        House(turnHouseLight: .constant(true), outsideLight: true, isOutsideLightOn: .constant([true, true]))
    }
}
