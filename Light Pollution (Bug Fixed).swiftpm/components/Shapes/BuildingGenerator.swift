//
//  BuildingGenerator.swift
//  
//
//  Created by Jonathan Lee on 13/04/23.
//

import SwiftUI

struct BuildingGenerator: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Initialize
    init(order: BuildingOrder, lightOrder: Int,  width: CGFloat = 60.0, height: CGFloat, windowConfiguration: [WindowConfig], bortleScaleValue: Binding<Float>) {
        // Building size
        self.height = height
        self.width = width
        
        // Window configuration
        self.windowConfiguration = windowConfiguration
        self.twoColumnGrid = Array(repeating: GridItem(.fixed(14), spacing: 0), count: 2)
        self.lightOrder = lightOrder
        self._bortleScaleValue = bortleScaleValue
        
        // Get color
        self.order = order
        switch(order) {
        case .top:
            self.color = Color.cityTopOrder
        case .middle:
            self.color = Color.cityMiddleOrder
        case .bottom:
            self.color = Color.cityBottomOrder
        }
    }
    
    // Building order
    var color: Color
    var order: BuildingOrder
    
    // Building size
    var height: CGFloat
    var width: CGFloat
    
    // Window configuration
    var windowConfiguration: [WindowConfig]
    var twoColumnGrid: [GridItem]
    var lightOrder: Int
    
    @Binding var bortleScaleValue: Float
    
    var body: some View {
        ZStack(alignment: .top) {
            // To handle building
            Rectangle()
                .fill(color)
                .frame(width: width, height: height)
            
            // To handle window placement and count
            VStack(spacing: 8) {
                // For each row of building
                ForEach(windowConfiguration, id:\.windowUUID) { configuration in
                    HStack {
                        // Two column window
                        LazyVGrid(columns: twoColumnGrid, alignment: .leading, spacing: 4) {
                            // Window
                            ForEach(0..<configuration.windowCount, id: \.self) { _ in
                                // Individual window
                                Rectangle()
                                    .fill(colorScheme == .dark && (Int(bortleScaleValue) > lightOrder - 1) ? Color.houseLightOn : Color.houseLightOff)
                                    .frame(width: 9, height: 12)
                                    .cornerRadius(1)
                            }
                        }
                        .padding(.horizontal, 6)
                        
                        // Push window to the left
                        Spacer()
                    }
                    .scaleEffect(CGSize(width: configuration.rightWindow ? -1.0 : 1.0, height: 1.0))

                }
                Spacer()
            }
            .padding(.vertical, 6)
            .frame(width: width, height: height)
        }
    }
}

enum BuildingOrder {
    case top, middle, bottom
}

struct WindowConfig {
    var windowUUID = UUID()
    var windowCount: Int
    var rightWindow: Bool = false
}
