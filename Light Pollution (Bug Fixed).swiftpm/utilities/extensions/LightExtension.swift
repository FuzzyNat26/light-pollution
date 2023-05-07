//
//  LightExtension.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

extension View {
    func glow(color: Color, radius: CGFloat) -> some View {
        self
            .overlay(self.blur(radius: radius / 6))
            .shadow(color: color, radius: radius / 2)
            .shadow(color: color, radius: radius / 5)
            .shadow(color: color, radius: radius / 10)
            .shadow(color: color, radius: radius / 25)
            .shadow(color: color, radius: radius / 50)
            .shadow(color: color, radius: radius / 100)
            .shadow(color: color, radius: radius / 250)
            .shadow(color: color, radius: radius / 500)
    }
}
