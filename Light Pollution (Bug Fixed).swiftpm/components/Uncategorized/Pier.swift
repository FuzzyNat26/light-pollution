//
//  Pier.swift
//  
//
//  Created by Jonathan Lee on 13/04/23.
//

import SwiftUI

struct Pier: View {
    var body: some View {
        VStack(spacing: 0) {
            // Top wood
            HStack(spacing: 8) {
                ForEach(1..<6) { _ in
                    Rectangle()
                        .fill(Color.topWood)
                        .frame(width: 45, height: 10)
                }
            }
            
            // Middle wood
            Rectangle()
                .fill(Color.bottomWood)
                .frame(width: 225, height: 12)
        
            // Bottom wood
            HStack(spacing: 80) {
                ForEach(1..<3) { _ in
                    Rectangle()
                        .fill(Color.bottomWood)
                        .frame(width: 20, height: 120)
                }
            }
        }
    }
}

struct Pier_Previews: PreviewProvider {
    static var previews: some View {
        Pier()
    }
}
