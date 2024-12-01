//
//  HomeViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

final class HomeViewModel {
    private var tags: [String] = ["Frontened", "iOS", "SwiftUI", "Backened" ,"UiKit"]
    
    func getTagsCount() -> Int {
        tags.count
    }
    
    func getTag(at index: Int) -> String {
        tags[index]
    }
}
