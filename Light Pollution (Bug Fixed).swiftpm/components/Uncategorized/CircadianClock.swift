//
//  CircadianClock.swift
//  
//
//  Created by Jonathan Lee on 16/04/23.
//

import SwiftUI

struct CircadianClock: View {
    
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Binding
    @Binding var isLightOn: Bool
    var scale: CGFloat = 1.0
    
    var body: some View {
        // Main clock
        ZStack(alignment: .top) {
            // Arrow
            Triangle()
                .fill(.red)
                .frame(width: 40 * scale, height: 60 * scale)
                .scaleEffect(CGSize(width: -1.0, height: -1.0))
                .zIndex(1.0)
                .offset(y: -10 * scale)
            
            // Clock
            ZStack {
                // Outer Clock
                Circle()
                    .fill(Color.circadianOuterClock)
                    .frame(width: 400 * scale, height: 400 * scale)
                
                // Inner clock
                VStack(spacing: 0) {
                    // Day
                    ZStack {
                        // Background
                        HalfCircle()
                            .fill(Color.circadianDay)
                            .frame(width: 347 * scale, height: 173.5 * scale)
                        
                        // Moon
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 50 * scale, height: 50 * scale)
                            .foregroundColor(Color.circadianSun)
                    }
                    // Night
                    ZStack {
                        // Background
                        HalfCircle()
                            .fill(Color.circadianNight)
                            .frame(width: 347 * scale, height: 173.5 * scale)
                        
                        // Moon
                        Image(systemName: "moon.fill")
                            .resizable()
                            .frame(width: 50 * scale, height: 50 * scale)
                            .foregroundColor(.white)
                    }
                    .scaleEffect(CGSize(width: -1.0, height: -1.0))
                }
                .rotationEffect(.degrees(
                    colorScheme == .dark
                    ? isLightOn ? 80.0 : 180.0
                    : 0.0
                ))
            }
        }
    }
}

struct CircadianClock_Previews: PreviewProvider {
    static var previews: some View {
        CircadianClock(isLightOn: .constant(true))
    }
}
