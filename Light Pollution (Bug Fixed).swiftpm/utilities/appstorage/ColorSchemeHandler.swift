//
//  ColorSchemeHandler.swift
//  
//
//  Created by Jonathan Lee on 18/04/23.
//

import SwiftUI

class ColorSchemeHandler {
    func getColorScheme(_ colorScheme: DeviceColorScheme) -> ColorScheme? {
        switch (colorScheme) {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

enum DeviceColorScheme: String, CaseIterable {
    case system, light, dark
}
