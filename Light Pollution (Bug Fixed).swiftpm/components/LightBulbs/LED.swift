//
//  LED.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct LED: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Light Configuration
    var bulbColor: Color = .streetLightOn
    var capColor: Color = .lightBulbCap
    var scale: Float = 1.0
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Bulb
            Bulb()
                .fill(isSelected ? bulbColor : .streetLightOff)
                .frame(width: 32 * CGFloat(scale), height: 40 * CGFloat(scale))
                .glow(color: colorScheme == .dark && isSelected ? Color.brightHouse.opacity(0.1) : .clear, radius: 200)
            
            // Bottom
            Rectangle()
                .fill(capColor)
                .frame(width: 16 * CGFloat(scale), height: 11 * CGFloat(scale))
            
            Rectangle()
                .fill(capColor)
                .frame(width: 10 * CGFloat(scale), height: 3 * CGFloat(scale))
        }
    }
}

struct LEDContainer: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle state
    @Binding var isSelected: Bool
    
    // Others
    var title: String = "LED"
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            VStack(spacing: 8) {
                VStack(alignment: .center) {
                    Text(title)
                        .bold()
                        .headingStyle()
                        .multilineTextAlignment(.center)
                }
                
                LED(isSelected: isSelected)
                    .frame(width: 35, height: 40)
                    .zIndex(-1.0)
            }
            .frame(minWidth: 80, maxWidth: .infinity, minHeight: 80)
            .padding()
            .foregroundColor(
                colorScheme == .dark
                ? .white
                : .black
            )
            .clipShape(Rectangle())
            .background(
                colorScheme == .dark
                ? .gray.opacity(isSelected ? 0.5 : 0.01)
                : .white.opacity(isSelected ? 0.2 : 0.01)
            )
            .border(
                colorScheme == .dark
                ? .white
                : .black
                , width: 2)
        }
    }
}

struct LED_Previews: PreviewProvider {
    static var previews: some View {
        LED(isSelected: true)
    }
}
