import SwiftUI

@main
struct MyApp: App {
    // Handle colorscheme
    @AppStorage("colorScheme") var colorScheme: DeviceColorScheme = .system
    
    // To handle first time user
    @AppStorage("firstTimeUser") var firstTimeUser: Bool = true
    
    var body: some Scene {        
        WindowGroup {
            ContentView()
                .preferredColorScheme(
                    ColorSchemeHandler().getColorScheme(colorScheme)
                )
                .fullScreenCover(isPresented: $firstTimeUser) {
                    Onboarding()
                }
        }
    }
}
