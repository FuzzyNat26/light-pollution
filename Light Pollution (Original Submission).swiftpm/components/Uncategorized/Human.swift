//
//  Human.swift
//  
//
//  Created by Jonathan Lee on 13/04/23.
//

import SwiftUI

struct Human: View {
    // Text
    @Binding var turnHouseLight: Bool
    var text: String?
    
    // Body configuration
    var scale: Float = 1.0
    var headSize: [CGFloat] = [20, 20]
    var bodySize: [CGFloat] = [27, 35]
    var headLookUp: Bool = true
    
    // Color
    var fill: AnyShapeStyle = AnyShapeStyle(Color.human)
    
    var body: some View {
        VStack(spacing: 4 * CGFloat(scale)) {
            if (turnHouseLight && text != nil) {
                Text(text!)
                    .foregroundColor(.white)
                    .offset(x: 140)
                    .rotationEffect(.degrees(-20))
            }
            
            // Head
            Rectangle()
                .rotation(.degrees(headLookUp ? -20 : 0))
                .fill(fill)
                .frame(width: headSize.first! * CGFloat(scale), height: headSize.last! * CGFloat(scale))
            
            // Body
            Rectangle()
                .fill(fill)
                .frame(width: bodySize.first! * CGFloat(scale), height: bodySize.last! * CGFloat(scale))
        }
    }
}
