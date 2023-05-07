//
//  TextExtension.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

extension Text {
    func headingStyle() -> some View {
        self
           .font(.title2)
           .padding(.bottom, 4)
    }
    
    func bodyStyle() -> some View {
        self
           .font(.body)
           .padding(.bottom, 4)
    }
}
