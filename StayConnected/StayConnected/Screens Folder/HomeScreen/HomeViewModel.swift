//
//  HomeViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation
import UIKit

final class HomeViewModel {
    private var tags: [String] = ["Frontened", "iOS", "SwiftUI", "Backened" ,"UiKit"]
    private var posts: [Question] = []

    func getPostsCount() -> Int {
        posts.count
    }
    
    func getTagsCount() -> Int {
        tags.count
    }
    
    func getTag(at index: Int) -> String {
        tags[index]
    }
    
    func fetchPosts(completion: @escaping () -> Void) {
        let url = URL(string: "http://54.93.229.43/rating/questions/?format=json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let postData = try JSONDecoder().decode([Question].self, from: data)
                self.posts = postData
                DispatchQueue.main.async {
                    print(self.posts)
                    completion()
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        task.resume()
    }
}
