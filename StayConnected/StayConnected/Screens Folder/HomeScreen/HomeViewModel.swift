//
//  HomeViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation
import UIKit

final class HomeViewModel {
    private var tagsForSearch: [String] = ["Frontened", "iOS", "SwiftUI", "Backened" ,"UiKit"]
    private var posts: [Question] = []

    func getPostsCount() -> Int {
        posts.count
    }
    
    func getTagsCountForSearch() -> Int {
        tagsForSearch.count
    }
    
    func getTagsForSearch(at index: Int) -> String {
        tagsForSearch[index]
    }
    
    func getTags(at index: Int) -> [Tag] {
        posts[index].tags
    }
    
    func getPostTitle(at index: Int) -> String {
        posts[index].title
    }
    
    func getPostAuthor(at index: Int) -> String {
        posts[index].author.username
    }
    
    func getPostReplies(at index: Int) -> Int {
        posts[index].answers_count
    }
    
    func getPost(at index: Int) -> Question {
        posts[index]
    }
    
    func filterPosts(by username: String) {
        posts = posts.filter { $0.author.username == username }
    }
    func fetchPosts(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:3001/userPost") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let postData = try JSONDecoder().decode([Question].self, from: data)
                self.posts = postData
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        task.resume()
    }
}
