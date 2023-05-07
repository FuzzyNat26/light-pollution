//
//  VerticalProgressView.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct VerticalProgressView: View {
    // Current progress view value
    var value: Float
    
    // Total progress view value
    var minimum: Float = 0
    var maximum: Float
    
    // Label
    var label: AnyView
    
    // Color
    var color: Color
    
    // Size
    var width: CGFloat = 10
    var height: CGFloat
    
    var body: some View {
        VStack {
            // Progress View
            ZStack(alignment: .bottom) {
                // Base
                Rectangle()
                    .fill(Color.baseProgressView)
                    .frame(width: width, height: height)
                    .cornerRadius(4)
                
                // Progress
                Rectangle()
                    .fill(color)
                    .frame(width: width, height: CGFloat(value - minimum) / CGFloat((maximum - minimum)) * height)
                    .cornerRadius(4)
            }
                
            // Label
            label
        }
    }
}
