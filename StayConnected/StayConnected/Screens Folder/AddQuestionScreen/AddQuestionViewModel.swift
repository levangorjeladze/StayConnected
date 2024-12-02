//
//  AddQuestionViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

final class AddQuestionViewModel {
    
    private var tags: [String] = ["Frontened", "iOS", "SwiftUI", "Backened" ,"UiKit", "Frontened", "iOS", "SwiftUI", "Backened" ,"UiKit"]
    
    func getTagsCount() -> Int {
        tags.count
    }
    
    func getTag(at index: Int) -> String {
        tags[index]
    }
}
