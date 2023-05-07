//
//  ButtonExtension.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(
                isEnabled ?
                    colorScheme == .dark
                    ? .white
                    : .black
                : .gray.opacity(0.7)
            )
            .clipShape(Rectangle())
            .padding(.vertical, 20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            .background(
                isEnabled
                ? colorScheme == .dark
                  ? .gray.opacity(configuration.isPressed ? 0.1 : 0.01)
                  : .white.opacity(configuration.isPressed ? 0.1 : 0.01)
                : .gray.opacity(0.2)
            )
            .border(
                isEnabled ?
                    colorScheme == .dark
                    ? .white
                    : .black
                : .gray.opacity(0.7)
            , width: 2)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct SmallPrimaryButton: ButtonStyle {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(
                colorScheme == .dark
                ? .white
                : .black
            )
            .clipShape(Rectangle())
            .padding()
            .background(
                colorScheme == .dark
                ? .black.opacity(configuration.isPressed ? 0.1 : 0.01)
                : .white.opacity(configuration.isPressed ? 0.1 : 0.01)
            )
            .border(
                colorScheme == .dark
                ? .white
                : .black
            , width: 2)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct LightBulbButton: ButtonStyle {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
    }
}
