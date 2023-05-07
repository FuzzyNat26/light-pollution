//
//  StreetLight.swift
//  
//
//  Created by Jonathan Lee on 13/04/23.
//

import SwiftUI

struct StreetLight: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Streetlight count
    var count: Int = 1
    
    // Streetlight configuration
    var poleSize: [CGFloat] = [14, 300]
    var lightRadius: CGFloat = 72.0
    var isLightOn: Bool = true
    var color: Color = Color.streetLightOn
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Array of lights
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count)) {
                ForEach(0..<count, id: \.self) { _ in
                    // Light
                    Circle()
                        .fill(isLightOn ? color: Color.streetLightOff)
                        .frame(width: lightRadius, height: lightRadius)
                }
            }
            .glow(
                color: colorScheme == .dark && isLightOn ? Color.brightHouse.opacity(0.5) : .clear,
                radius: colorScheme == .dark && isLightOn ? 250 : 0
            )
            
            // Array of poles
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count)) {
                ForEach(0..<count, id: \.self) { _ in
                    // Light
                    Rectangle()
                        .fill(Color.cityTopOrder)
                        .frame(width: poleSize.first!, height: poleSize.last!)
                }
            }
        }
    }
}

struct StreetLight_Previews: PreviewProvider {
    static var previews: some View {
        StreetLight()
    }
}
