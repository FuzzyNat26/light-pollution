//
//  Credits.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct Credits: View {
    // Credits
    let credits: [CreditsModel] = [
        CreditsModel(title: "Light Pollution", origin: "Let's Talk Science", originLink: "https://letstalkscience.ca/educational-resources/stem-in-context/light-pollution"),
        CreditsModel(title: "Light Pollution", origin: "Blanco County Friends of The Night Sky", originLink: "https://www.blancocountynightsky.org/lightpollution.php"),
        CreditsModel(title: "Light Pollution: Types, Causes & Effects and Effective Solutions", origin: "Conserve Energy Future", originLink: "https://www.conserve-energy-future.com/types-causes-and-effects-of-light-pollution.php"),
        CreditsModel(title: "Light Pollution Hurts the Environment, Hides the Night Sky", origin: "Florida Atlantic University (FAU) Astronomical Observatory", originLink: "https://cescos.fau.edu/observatory/lightpol.html"),
        CreditsModel(title: "Light Pollution", origin: "National Geographic", originLink: "https://education.nationalgeographic.org/resource/light-pollution/3rd-grade/"),
        CreditsModel(title: "Missing the Dark - Health Effects of Light Pollution", origin: "Environmental Health Perspectives", originLink: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2627884/pdf/EHP-117-a20.pdf"),
        CreditsModel(title: "How Light Affects Human Melatonin Levels", origin: "Florida Atlantic University (FAU) Astronomical Observatory", originLink: "https://cescos.fau.edu/observatory/lightpol-melatonin.html"),
        CreditsModel(title: "Light Pollution Is More Dangerous Than You Think!", origin: "Seeker", originLink: "https://www.youtube.com/watch?v=sYAzTYmXMBg"),
        CreditsModel(title: "Light pollution", origin: "Wikipedia", originLink: "https://en.wikipedia.org/wiki/Light_pollution"),
        CreditsModel(title: "Bortle Scale", origin: "Wikipedia", originLink: "https://en.wikipedia.org/wiki/Bortle_scale"),
        CreditsModel(title: "How Dark is My Sky? An Astronomer's Guide to The Bortle Scale", origin: "Love The Night Sky", originLink: "https://lovethenightsky.com/bortle-scale/"),
        CreditsModel(title: "Bortle Scale", origin: "Academo", originLink: "https://academo.org/demos/bortle-scale/"),
        CreditsModel(title: "Light Pollution Map", origin: "Light Pollution Map", originLink: "https://www.lightpollutionmap.info/"),
        CreditsModel(title: "Understanding light pollution: Recent advances on its health threats and regulations", origin: "Science Direct", originLink: "https://www.sciencedirect.com/science/article/abs/pii/S1001074222003291"),
        CreditsModel(title: "What Makes You Tick: Circadian Rhythms", origin: "OxfordSparks", originLink: "https://www.youtube.com/watch?v=2BoLqqNuqwA"),
        CreditsModel(title: "Melatonin Inhibition and Circadian Rhythms", origin: "Hussain Biology", originLink: "https://www.youtube.com/watch?v=MRJ8JjonAf0"),
        CreditsModel(title: "How does your body know what time it is? - Marco A. Sotomayor", origin: "TED-Ed", originLink: "https://www.youtube.com/watch?v=Y8ZXOfWUbms"),
        CreditsModel(title: "Light Pollution", origin: "International Dark-Sky Association", originLink: "https://www.darksky.org/light-pollution/"),
    ]
    
    let others: [CreditsModel] = [
        CreditsModel(title: "Convert SVG to SwiftUI Path", origin: "Quassum", originLink: "https://svg-to-swiftui.quassum.com/"),
        CreditsModel(title: "Color Temperature to RGB", origin: "David Fearon", originLink: "https://github.com/davidf2281/ColorTempToRGB/"),
        CreditsModel(title: "Star Generator", origin: "Bart Goselink", originLink: "https://www.figma.com/community/plugin/1211715210768638791/Star-Generator")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(alignment: .leading) {
                Text("""
                This has been a great experience for me to learn more about light pollution.

                I have gained a lot of new insights and knowledge on this topic from various wonderful websites and articles that I came across during my research. I would like to acknowledge and give credit to these resources for their invaluable help and information.
                """)
                .bodyStyle()
                .padding(.bottom, 24)
                
                // Resources
                Group {
                    Text("Resources")
                        .bold()
                        .headingStyle()
                    
                    ForEach(credits, id: \.self) { credit in
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Image(systemName: "link")
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("**\(credit.title)** | \(credit.origin)")
                                    .multilineTextAlignment(.leading)
                                
                                Link(destination: URL(string: credit.originLink)!, label: {
                                    Text("\(credit.originLink)")
                                        .underline()
                                        .multilineTextAlignment(.leading)
                                })
                                
                                Divider()
                            }
                        }
                    }
                }
                
                // Others
                Group {
                    Text("Others")
                        .bold()
                        .headingStyle()
                        .padding(.top, 24)
                    
                    ForEach(others, id: \.self) { credit in
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Image(systemName: "link")
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("**\(credit.title)** | \(credit.origin)")
                                    .multilineTextAlignment(.leading)
                                
                                Link(destination: URL(string: credit.originLink)!, label: {
                                    Text("\(credit.originLink)")
                                        .underline()
                                        .multilineTextAlignment(.leading)
                                })
                                
                                Divider()
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
    }
}

struct CreditsModel: Hashable {
    var title: String
    var origin: String
    var originLink: String
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
