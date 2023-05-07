//
//  Page.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct Page: Identifiable, Hashable, Equatable {
    static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id = UUID()
    var title: String
    var systemImage: String
    var destination: AnyView
    var isActive: Bool
}

struct PageModel {
    static let userDefaultsArray: [String] = UserDefaults.standard.array(forKey: "contentProgress") as? [String] ?? ["Introduction"]
    
    static let mainPageList: [Page] = [
        .init(
            title: "Introduction",
            systemImage: "text.alignleft",
            destination: AnyView(Introduction()),
            isActive: userDefaultsArray.contains("Introduction")
        ),
        .init(
            title: "Light Pollution",
            systemImage: "text.alignleft",
            destination: AnyView(LightPollution()),
            isActive: userDefaultsArray.contains("Light Pollution")
        ),
        .init(
            title: "Types of Light Pollution",
            systemImage: "text.alignleft",
            destination: AnyView(LightPollutionTypes()),
            isActive: userDefaultsArray.contains("Types of Light Pollution")
        ),
        .init(
            title: "Why We Should Aware?",
            systemImage: "text.alignleft",
            destination: AnyView(LightPollutionAwareness()),
            isActive: userDefaultsArray.contains("Why We Should Aware?")
        ),
        .init(
            title: "What Should We Do?",
            systemImage: "text.alignleft",
            destination: AnyView(WhatWeNeedToDo()),
            isActive: userDefaultsArray.contains("What Should We Do?")
        ),
        .init(
            title: "Conclusion",
            systemImage: "text.alignleft",
            destination: AnyView(Conclusion()),
            isActive: userDefaultsArray.contains("Conclusion")
        ),
    ]
    
    static let sidePageList: [Page] = [
        .init(title: "Credits", systemImage: "doc.text", destination: AnyView(Credits()), isActive: true),
        .init(title: "Settings", systemImage: "gear", destination: AnyView(Settings()), isActive: true)
    ]
}
