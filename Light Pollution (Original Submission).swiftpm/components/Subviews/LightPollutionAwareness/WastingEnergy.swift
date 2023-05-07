//
//  WastingEnergy.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct WastingEnergy: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle state
    @State var streetLightCount: Float = 1
    @State var isChanging: Bool = false
    
    // Streetlight count
    let MIN_COUNT: Float = 0
    let MAX_COUNT: Float = 5
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                    // Streetlight and indicator
                    ZStack (alignment: .bottomLeading) {
                        // Streetlight
                        StreetLight(count: Int(streetLightCount), poleSize: [14, 250])
                            .animation(.linear(duration: 0.1), value: streetLightCount)
                        
                        if (colorScheme == .dark) {
                            // Electricity indicator
                            VStack(spacing: 8) {
                                VerticalProgressView(
                                    value: streetLightCount,
                                    maximum: MAX_COUNT,
                                    label: AnyView(
                                        Image(systemName: "bolt.fill")
                                            .tint(setProgressViewColor())
                                    ),
                                    color: setProgressViewColor(),
                                    height: 400
                                )
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            isChanging = true
                                            
                                            // Current Location
                                            let yLocation = Float(value.location.y)
                                            
                                            // Calculate total lights relative to height (400)
                                            let step = MAX_COUNT - MIN_COUNT
                                            let convertedNumber = step - ((yLocation / 400) * step) + MIN_COUNT
                                            
                                            // Limit between 0 and step
                                            let limitedNumber = max(MIN_COUNT, min(MAX_COUNT, convertedNumber))
                                            
                                            streetLightCount = round(limitedNumber)
                                        }
                                        .onEnded({ _ in
                                            isChanging = false
                                        })
                                )
                            }
                            .padding()
                            .background(isChanging ? .gray.opacity(0.7) : .gray.opacity(0.5))
                            .cornerRadius(24)
                            .padding()
                        }
                    }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottomLeading)

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
                            // Little description
                            Text(getElectricityDescription())
                                .bold()
                                .bodyStyle()
                                .multilineTextAlignment(.center)
                            
                            // Text
                            Text("Street Light Count: \(Int(streetLightCount))")
                                .bodyStyle()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
    }
    
    func setProgressViewColor() -> Color {
        switch (streetLightCount) {
        case 1:
            return .gray
        case 2:
            return .green
        case 3:
            return .blue
        case 4:
            return .yellow
        case 5:
            return .red
        default:
            return .clear
        }
    }
    
    func getElectricityDescription() -> String {
        switch (streetLightCount) {
        case 1:
            return "Very low electricity usage"
        case 2:
            return "Low electricity usage"
        case 3:
            return "Moderate electricity usage"
        case 4:
            return "High electricity usage"
        case 5:
            return "Very high electricity usage"
        default:
            return "No electricity"
        }
    }
}

struct WastingEnergy_Previews: PreviewProvider {
    static var previews: some View {
        WastingEnergy()
    }
}
