//
//  HalfHouse.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct HalfHouse: View {
    @Environment(\.colorScheme) var colorScheme
    var turnHouseLight: Bool // To handle inner house lights
    var otherHouseLight: Bool // To handle house shined by lights
    
    // Extra parameter
    var outsideLight: Bool = true // To handle light that are hanging outside
    var fill: AnyShapeStyle = AnyShapeStyle(Color.brightHouse)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RightTriangle()
                .fill(
                    otherHouseLight && colorScheme == .dark
                    // If light have turned on
                    ? fill
                    // Else
                    : AnyShapeStyle(Color.house)
                )
                .zIndex(1)
                .frame(width: 180, height: 130)
                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 10)
            HStack(alignment: .top) {
                // Building
                ZStack {
                    Rectangle()
                        .fill(
                            otherHouseLight && colorScheme == .dark
                            // If light have turned on
                            ? fill
                            // Else
                            : AnyShapeStyle(Color.house)
                        )
                        .frame(width: 130, height: 130)
                    HStack(spacing: 40) {
                        Rectangle()
                            .fill(colorScheme == .dark && turnHouseLight ? Color.houseLightOn : Color.houseLightOff)
                            .frame(width: 25, height: 60)
                            .cornerRadius(4)
                    }
                }
                
                // Light
                if (outsideLight) {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.bottomWood)
                            .frame(width: 5, height: 5)
                        
                        Circle()
                            .fill(Color.streetLightOn)
                            .frame(width: 25, height: 25)
                            .glow(color: colorScheme == .dark ? Color.brightHouse.opacity(0.5) : .clear, radius: 250)
                            .zIndex(2.0)
                    }
                    .padding(.leading, 4)
                }
            }
        }
    }
}

struct HalfHouse_Previews: PreviewProvider {
    static var previews: some View {
        HalfHouse(turnHouseLight: true, otherHouseLight: false)
    }
}
