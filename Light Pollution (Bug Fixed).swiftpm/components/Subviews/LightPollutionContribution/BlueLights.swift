//
//  BlueLights.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct BlueLights: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle state
    @State var cctSlider: Float = 7000
    @State var isChanging: Bool = false
    @Binding var isLightTemperatureAccepted: Bool
    
    // Other parameters
    let MIN_TEMP: Float = 1000.0
    let MAX_TEMP: Float = 10000.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Land and Building
            VStack(spacing: 0) {
                Spacer()
                // Streetlight and indicator
                ZStack (alignment: .bottomLeading) {
                    // Streetlight
                    StreetLight(color: colorScheme == .dark ? Color(temperature: CGFloat(cctSlider)) : Color.streetLightOff)
                        .animation(.linear(duration: 0.1), value: cctSlider)
                    
                    if (colorScheme == .dark) {
                        // Electricity indicator
                        VStack(spacing: 8) {
                            VerticalProgressView(
                                value: cctSlider,
                                minimum: MIN_TEMP,
                                maximum: MAX_TEMP,
                                label: AnyView(
                                    Image(systemName: "thermometer.low")
                                ),
                                color: Color(temperature: CGFloat(cctSlider)),
                                height: 400
                            )
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        isChanging = true
                                        
                                        // Current Location
                                        let yLocation = Float(value.location.y)
                                        
                                        // Calculate total lights relative to height (400)
                                        let step = MAX_TEMP - MIN_TEMP
                                        let convertedNumber = step - ((yLocation / 400) * step) + MIN_TEMP
                                        
                                        // Limit between 0 and step
                                        let limitedNumber = max(MIN_TEMP, min(MAX_TEMP, convertedNumber))
                                        
                                        cctSlider = round(limitedNumber)
                                    }
                                    .onEnded({ _ in
                                        isChanging = false
  
                                        isLightTemperatureAccepted = cctSlider <= 3000
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
                            Text("Range lower than 3000K")
                                .bold()
                                .headingStyle()
                                .foregroundColor(isLightTemperatureAccepted ? .green : nil)
                                .multilineTextAlignment(.center)
                            
                            Text("Current Temperature: \(String(format: "%.0f", cctSlider))K")
                                .headingStyle()
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct BlueLights_Previews: PreviewProvider {
    static var previews: some View {
        BlueLights(isLightTemperatureAccepted: .constant(true))
    }
}
