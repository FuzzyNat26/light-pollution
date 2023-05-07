//
//  Car.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct Car: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text(colorScheme == .light
                     ? "What a nice day!"
                     : "I'm having a hard time seeing \nwith these grouped lights!"
                )
                    .foregroundColor(.white)
                    .offset(y: colorScheme == .dark ? -70 : -50)
                
                
                // Human and windshield
                HStack(alignment: .bottom, spacing: 24) {
                    // Human
                    Human(
                        turnHouseLight: .constant(false),
                        headSize: [25, 25],
                        bodySize: [30, 20],
                        headLookUp: colorScheme == .dark ? true : false,
                        fill: colorScheme == .dark ?
                            AnyShapeStyle(
                                LinearGradient(
                                    colors: [Color.streetLightOn, Color.human],
                                    startPoint: .top,
                                    endPoint: .center
                                )
                            )
                        : AnyShapeStyle(Color.human)
                    )
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.carWindShield)
                            .frame(width: 20, height: 42)
                        RightTriangle()
                            .fill(Color.carWindShield)
                            .frame(width: 12, height: 42)
                    }
                }
                .offset(x: 15)
            }
            
            
            // Car Body
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.carBody)
                    .frame(width: 172, height: 42)
                HStack {
                    HalfCircle()
                        .fill(Color.carTire)
                        .frame(width: 40, height: 20)
                        .scaleEffect(CGSize(width: 1.0, height: -1.0))
                    Spacer()
                    HalfCircle()
                        .fill(Color.carTire)
                        .frame(width: 40, height: 20)
                        .scaleEffect(CGSize(width: 1.0, height: -1.0))
                }
                .frame(width: 135)
            }
        }
    }
}

struct Car_Previews: PreviewProvider {
    static var previews: some View {
        Car()
    }
}
