//
//  ContentView.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//
//  Detail description of the playground can be found in README.md

import SwiftUI

struct ContentView: View {
    // To handle navigation
    @StateObject var navModel: NavigationModel = NavigationModel()

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationSplitView {
                List(selection: $navModel.selectedPage) {
                    Section {
                        ForEach(navModel.mainPageList) { page in
                            NavigationLink(value: page) {
                                Label(page.title, systemImage: page.systemImage)
                            }
                            .disabled(!page.isActive)
                        }
                    }
                    
                    Section {
                        ForEach(navModel.sidePageList) { page in
                            NavigationLink(value: page) {
                                Label(page.title, systemImage: page.systemImage)
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Light Pollution")
            } detail: {
                if let selectedPage = navModel.selectedPage {
                    if (selectedPage.isActive) {
                        selectedPage.destination
                            .navigationTitle(navModel.selectedPage!.title)
                            .environmentObject(navModel)
                    } else {
                        VStack(spacing: 8) {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 30, height: 30 * 1.4126)
                            
                            Text("This page is still locked")
                                .bold()
                                .font(.title2)
                                .multilineTextAlignment(.center)
                            
                            Text("Please finish previous section before heading to this page.")
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
            Text("This playground required iPadOS 16 or macOS 13.")
        }
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            print("Init from result: \(result)")
            self = result
        } catch {
            print("Error: \(error)")
            return nil
        }
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        print("Returning \(result)")
        return result
    }
}
