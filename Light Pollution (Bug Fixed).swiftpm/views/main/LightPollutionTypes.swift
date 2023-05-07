//
//  LightPollutionTypes.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct LightPollutionTypes: View {
    // Handle color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Handle navigation
    @EnvironmentObject var navModel: NavigationModel
    
    // Handle state
    @State var skyGlowToggle: Bool = true
    @State var clutterToggle: Bool = true
    @State var glareToggle: Bool = true
    @State var lightTrespassToggle: Bool = true
    
    var body: some View {
        HStack(spacing: 0) {
            // Content
            ScrollView(showsIndicators: true) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("""
                    There are different types of light pollution affected by artificial lights. Commonly, artificial lights will cause more than one of them, which include:
                    """)
                        .bodyStyle()
                        .padding(.bottom, 24)
                    
                    // Glare
                    Group {
                        Text("Glare")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        Glare is a visual discomfort caused by excessive brightness from artificial lights. For example, a streetlight that is that shine directly to your eyes.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    // Light trespass
                    Group {
                        Text("Light Trespass")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        This happens when the light is trespassing in places that are not intended. For example, neighbor's outdoor lightning shine into our house.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    // Skyglow
                    Group {
                        Text("Skyglow")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        Like its name, skyglow is a visible glowing night sky that we can see from inhabited areas. It usually happens near dense cities where the bottle scale is around level 4 to level 9.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    // Clutter
                    Group {
                        Text("Clutter")
                            .bold()
                            .headingStyle()
                        
                        Text("""
                        Clutter is an excessively bright and confusing light source that groups together. A common example of clutter includes a group of bright streetlights placed closely together or a large billboard with flashing lights on the side of a street.
                        """)
                            .bodyStyle()
                            .padding(.bottom, 24)
                    }
                    
                    Text("""
                    Let's see each type in an interactive form on the right.
                    """)
                        .bodyStyle()
                        .padding(.bottom, 32)
                    
                    Button("Continue") {
                        navModel.nextPage()
                    }
                    .buttonStyle(PrimaryButton())
                    .padding(.bottom, 24)
                }
            }
            .padding(.horizontal, 20)
            .overlay(Divider(), alignment: .trailing)
            
            // Visual
            TabView {
                // Glare caused by Streetlight
                GlareStreetLight()
                
                // Light Trespass
                LightTrespass()
                
                // Skyglow
                SkyGlow(bortleScaleValue: skyGlowToggle ? .constant(9.0) : .constant(0.0))
                
                // Clutter
                Clutter()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.skyBlue)
            .edgesIgnoringSafeArea(.vertical)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onDisappear() {
            AudioPlayer.shared.audioPlayer = nil
        }
    }
}

struct LightPollutionTypes_Previews: PreviewProvider {
    static var previews: some View {
        LightPollutionTypes()
    }
}
