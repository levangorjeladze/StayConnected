//
//  QuestionDetailViewModel.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import Foundation

final class QuestionDetailViewModel {
    
    var question: Question
    
    init(question: Question) {
        self.question = question
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .short
            return displayFormatter.string(from: date)
        } else {
            return "Unknown Date"
        }
    }
}
