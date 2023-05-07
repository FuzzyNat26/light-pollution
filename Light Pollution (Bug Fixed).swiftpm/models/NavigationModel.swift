//
//  NavigationModel.swift
//  
//
//  Created by Jonathan Lee on 16/04/23.
//

import SwiftUI

class NavigationModel: ObservableObject {
    // To get pageList
    @Published var mainPageList: [Page]
    
    @Published var sidePageList: [Page]
    
    // To handle page selector for navigation purposes
    @Published var selectedPage: Page?
    
    init() {
        // Handle main page
        self.mainPageList = PageModel.mainPageList
        
        // Handle side page
        self.sidePageList = PageModel.sidePageList
        
        // Handle selected page
        self._selectedPage = Published(initialValue: mainPageList.first!)
    }
    
    func nextPage() {
        if (selectedPage! != mainPageList.last!) {
            // Activate the next index
            mainPageList[mainPageList.firstIndex(of: selectedPage!)! + 1].isActive = true
            
            // Head to the next index
            selectedPage! = mainPageList[mainPageList.firstIndex(of: selectedPage!)! + 1]
            
            // Current local storage
            var currentLocalStorage = UserDefaults.standard.array(forKey: "contentProgress") as? [String] ?? ["Introduction"]
            currentLocalStorage.append(selectedPage!.title)
            
            UserDefaults.standard.set(
                currentLocalStorage,
                forKey: "contentProgress"
            )
        }
    }
    
    func credits() {
        self.selectedPage = sidePageList.first!
    }
}
