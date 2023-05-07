//
//  City.swift
//  
//
//  Created by Jonathan Lee on 13/04/23.
//

import SwiftUI

struct City: View {
    // Initialize
    init(bortleScaleValue: Binding<Float>) {
        // Bortle Scale Value
        self._bortleScaleValue = bortleScaleValue
        
        // City
        self.city = [
            // 1
            BuildingGenerator(
                order: .top,
                lightOrder: 5,
                height: 118,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 6, rightWindow: true)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 2
            BuildingGenerator(
                order: .bottom,
                lightOrder: 9,
                width: 60,
                height: 170,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4, rightWindow: true),
                        WindowConfig(windowCount: 2)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 3
            BuildingGenerator(
                order: .top,
                lightOrder: 8,
                height: 130,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 6, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 4
            BuildingGenerator(
                order: .bottom,
                lightOrder: 2,
                width: 75,
                height: 50,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 5
            BuildingGenerator(
                order: .top,
                lightOrder: 6,
                width: 60,
                height: 65,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 6
            BuildingGenerator(
                order: .middle,
                lightOrder: 4,
                width: 70,
                height: 85,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 6),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 7
            BuildingGenerator(
                order: .top,
                lightOrder: 3,
                width: 75,
                height: 120,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4),
                        WindowConfig(windowCount: 4)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 8
            BuildingGenerator(
                order: .bottom,
                lightOrder: 5,
                width: 30,
                height: 50,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 9
            BuildingGenerator(
                order: .top,
                lightOrder: 2,
                height: 170,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 6),
                        WindowConfig(windowCount: 4, rightWindow: true)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 10
            BuildingGenerator(
                order: .middle,
                lightOrder: 7,
                width: 60,
                height: 85,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 11
            BuildingGenerator(
                order: .top,
                lightOrder: 9,
                width: 65,
                height: 120,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4),
                        WindowConfig(windowCount: 4)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 12
            BuildingGenerator(
                order: .bottom,
                lightOrder: 4,
                width: 65,
                height: 35,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 13
            BuildingGenerator(
                order: .top,
                lightOrder: 8,
                height: 80,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 14
            BuildingGenerator(
                order: .middle,
                lightOrder: 4,
                height: 60,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 15
            BuildingGenerator(
                order: .top,
                lightOrder: 9,
                width: 70,
                height: 110,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 6, rightWindow: true),
                        WindowConfig(windowCount: 4),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 16
            BuildingGenerator(
                order: .bottom,
                lightOrder: 6,
                height: 60,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 17
            BuildingGenerator(
                order: .top,
                lightOrder: 3,
                height: 50,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 2),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 18
            BuildingGenerator(
                order: .middle,
                lightOrder: 5,
                height: 100,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4, rightWindow: true),
                    ],
                bortleScaleValue: bortleScaleValue
            ),
            
            // 19
            BuildingGenerator(
                order: .top,
                lightOrder: 9,
                width: 65,
                height: 120,
                windowConfiguration:
                    [
                        WindowConfig(windowCount: 4),
                        WindowConfig(windowCount: 4)
                    ],
                bortleScaleValue: bortleScaleValue
            ),
        ]
    }
    
    // Binding bortle level
    @Binding var bortleScaleValue: Float
    
    // City Variable
    let city: [BuildingGenerator]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(city.indices, id: \.self) { index in
                city[index]
                    .offset(x: index == 0 ? 0 : (-10 * CGFloat(index)))
                    .zIndex(setZIndex(order: city[index].order))
            }
        }
    }
    
    func setZIndex(order: BuildingOrder ) -> Double {
        switch(order) {
        case .top:
            return 3.0
        case .middle:
            return 2.0
        case .bottom:
            return 1.0
        }
    }
}
