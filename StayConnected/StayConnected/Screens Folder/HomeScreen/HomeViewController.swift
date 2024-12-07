//
//  HomeViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var tagsForQuestions: [Tag] = []
    
    private let questionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Questions"
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var addQuestionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(hex: "#4E53A2")
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector (addQuestionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let questionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let navigationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let generalButton: UIButton = {
        let button = UIButton()
        button.setTitle("General", for: .normal)
        button.backgroundColor = UIColor(hex: "#4E53A2")
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let personalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Personal", for: .normal)
        button.backgroundColor = . systemGray
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var questionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.identifier)
        tableView.register(EmptyQuestionsCell.self, forCellReuseIdentifier: EmptyQuestionsCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupQuestionStackView()
        setupNavigation()
        setupQuestionTableView()
        viewModel.fetchPosts { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.questionTableView.reloadData()
            }
        }
    }
    
    private func setupQuestionStackView() {
        view.addSubview(questionsStackView)
        questionsStackView.addArrangedSubview(questionsLabel)
        questionsStackView.addArrangedSubview(addQuestionButton)
        
        questionsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        questionsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
            .isActive = true
        questionsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
            .isActive = true
    }
    
    private func setupNavigation() {
        view.addSubview(navigationStackView)
        navigationStackView.addArrangedSubview(generalButton)
        navigationStackView.addArrangedSubview(personalButton)
        
        navigationStackView.leadingAnchor.constraint(equalTo: questionsStackView.leadingAnchor)
            .isActive = true
        navigationStackView.trailingAnchor.constraint(equalTo: questionsStackView.trailingAnchor)
            .isActive = true
        navigationStackView.topAnchor.constraint(equalTo: questionsStackView.bottomAnchor, constant: 20)
            .isActive = true
        
        personalButton.addTarget(self, action: #selector(personalButtonTapped), for: .touchUpInside)
        generalButton.addTarget(self, action: #selector(generalButtonTapped), for: .touchUpInside)
    }
    
    private func setupQuestionTableView() {
        view.addSubview(questionTableView)
        
        questionTableView.topAnchor.constraint(equalTo: navigationStackView.bottomAnchor, constant: 20).isActive = true
        questionTableView.leadingAnchor.constraint(equalTo: navigationStackView.leadingAnchor)
            .isActive = true
        questionTableView.trailingAnchor.constraint(equalTo: navigationStackView.trailingAnchor)
            .isActive = true
        questionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc private func addQuestionButtonTapped() {
        navigationController?.present(AddQuestionViewController(), animated: true)
    }
    
    @objc private func personalButtonTapped() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.personalButton.backgroundColor = UIColor(hex: "#4E53A2")
            self?.generalButton.backgroundColor = . systemGray
        }
        viewModel.filterPosts(by: "user")
        questionTableView.reloadData()
    }
    @objc private func generalButtonTapped() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.generalButton.backgroundColor = UIColor(hex: "#4E53A2")
            self?.personalButton.backgroundColor = . systemGray
        }
        viewModel.fetchPosts { [weak self] in
            self?.questionTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModel.getPostsCount() > 0 ? viewModel.getPostsCount() : 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath)
                    as? SearchTableViewCell else { return UITableViewCell() }
            tableView.allowsSelection = false
            return cell
        case 1:
            if viewModel.getPostsCount() > 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath)
                        as? QuestionTableViewCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                cell.tags.append(contentsOf: (self.viewModel.getTags(at: indexPath.row)))
                cell.titleLabel.text = viewModel.getPostAuthor(at: indexPath.row)
                cell.questionLabel.text = viewModel.getPostTitle(at: indexPath.row)
                cell.repliesLabel.text = "Replies: \(viewModel.getPostReplies(at: indexPath.row))"
                tableView.allowsSelection = true

                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyQuestionsCell.identifier, for: indexPath)
                        as? EmptyQuestionsCell else {
                    return UITableViewCell()
                }
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionDetailsViewModel = QuestionDetailViewModel(question: viewModel.getPost(at: indexPath.row))
        let questionDetailsVC = QuestionDetailViewController(viewModel: questionDetailsViewModel)
        navigationController?.pushViewController(questionDetailsVC, animated: true)
    }
}
