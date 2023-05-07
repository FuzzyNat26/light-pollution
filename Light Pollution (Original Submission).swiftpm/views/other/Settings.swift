//
//  Settings.swift
//  
//
//  Created by Jonathan Lee on 18/04/23.
//

import SwiftUI

struct Settings: View {
    // Handle colorscheme
    @AppStorage("colorScheme") var colorScheme: DeviceColorScheme = .system
    
    var body: some View {
        List {
            Section(content: {
                Picker("Appearance", selection: $colorScheme) {
                    Text("Device settings").tag(DeviceColorScheme.system)
                    Text("Light mode").tag(DeviceColorScheme.light)
                    Text("Dark mode").tag(DeviceColorScheme.dark)
                }
                .pickerStyle(.menu)
            }, header: {
                Text("Playground apperance settings")
            }, footer: {
                Text("This playground will dynamically use the mode that are currently selected. It is recommended to use **Dark Mode** to simulate our dark sky 😉")
            })
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
