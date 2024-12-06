//
//  QuestionDetailViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

final class QuestionDetailViewController: UIViewController {
    
    private var viewModel: QuestionDetailViewModel?
    
    private let questionTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionAuthorAndDate: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionBody: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupQuestionTitle()
        setupQuestionDetails()
        setupQuestionBody()
    }
    
    init(viewModel: QuestionDetailViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuestionTitle() {
        view.addSubview(questionTitle)
        
        questionTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        questionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        questionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        questionTitle.text = viewModel?.question.title
    }
    
    private func setupQuestionDetails() {
        view.addSubview(questionAuthorAndDate)
        
        questionAuthorAndDate.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 8).isActive = true
        questionAuthorAndDate.trailingAnchor.constraint(equalTo: questionTitle.trailingAnchor).isActive = true
        questionAuthorAndDate.leadingAnchor.constraint(equalTo: questionTitle.leadingAnchor).isActive = true
        
        let date = viewModel!.question.created_at
        let username = viewModel!.question.author.username
        questionAuthorAndDate.text = "@\(username) asked on \(String(describing: viewModel!.formatDate(date)))"
    }
    
    private func setupQuestionBody() {
        view.addSubview(questionBody)
        
        questionBody.topAnchor.constraint(equalTo: questionAuthorAndDate.bottomAnchor, constant: 16).isActive = true
        questionBody.trailingAnchor.constraint(equalTo: questionAuthorAndDate.trailingAnchor).isActive = true
        questionBody.leadingAnchor.constraint(equalTo: questionAuthorAndDate.leadingAnchor).isActive = true
        
        questionBody.text = viewModel?.question.body
    }
}

