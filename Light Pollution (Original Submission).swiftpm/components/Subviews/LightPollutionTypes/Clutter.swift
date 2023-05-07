//
//  Clutter.swift
//  
//
//  Created by Jonathan Lee on 15/04/23.
//

import SwiftUI

struct Clutter: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle car animation
    @State var startCar: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                
                // Streetlight and car
                ZStack (alignment: .bottomLeading) {
                    // Streetlight
                    StreetLight(count: 3)
                    
                    Car()
                        .animation(.linear(duration: 12).repeatForever(autoreverses: false), value: startCar)
                        .offset(x: startCar ? 1000 : -300)
                }
                
                // Land
                ZStack {
                    Rectangle()
                        .fill(Color.land)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    
                    if (colorScheme == .light) {
                        Text("Please turn on dark mode for the full experiences :)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    } else {
                        VStack {
                            Text("Clutter")
                                .bold()
                                .headingStyle()
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
        .onAppear() {
            startCar = true
        }
    }
}

struct Clutter_Previews: PreviewProvider {
    static var previews: some View {
        Clutter()
    }
}
