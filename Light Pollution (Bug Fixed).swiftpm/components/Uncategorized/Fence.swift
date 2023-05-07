//
//  Fence.swift
//  
//
//  Created by Jonathan Lee on 18/04/23.
//

import SwiftUI

struct Fence: View {
    // Fence configuration
    var count: Int = 5
    var scale: Float = 1.0
    
    var body: some View {
        ZStack {
            // Rail wood
            Rectangle()
                .fill(Color.railWood)
                .frame(width: 130 * CGFloat(scale), height: 7 * CGFloat(scale))
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count)) {
                ForEach(0..<count, id: \.self) {
                    _ in
                    
                    VStack(spacing: 0) {
                        // Top part
                        Triangle()
                            .fill(Color.picketWood)
                            .frame(width: 12 * CGFloat(scale), height: 4.5 * CGFloat(scale))
                        
                        // Bottom part
                        Rectangle()
                            .fill(Color.picketWood)
                            .frame(width: 12 * CGFloat(scale), height: 27.5 * CGFloat(scale))
                    }
                }
            }
                .padding(.horizontal, 4)
        }
        .frame(minWidth: 0, maxWidth: 120)
    }
}

struct Fence_Previews: PreviewProvider {
    static var previews: some View {
        Fence()
    }
}
