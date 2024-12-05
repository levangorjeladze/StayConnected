//
//  Question.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

struct Question: Codable {
    let id: Int
    let title: String
    let body: String
    let author: Author
    let tags: [Tag]
    let created_at: String
    let upvotes: Int
    let downvotes: Int
    let answers_count: Int
}

struct Tag: Codable {
    let id: Int
    let name: String
}

struct Author: Codable {
    let id: Int
    let username: String

}
