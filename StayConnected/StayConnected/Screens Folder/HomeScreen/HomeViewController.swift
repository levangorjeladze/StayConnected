//
//  HomeViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
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
    
    private let personallButton: UIButton = {
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
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
        navigationStackView.addArrangedSubview(personallButton)
        
        navigationStackView.leadingAnchor.constraint(equalTo: questionsStackView.leadingAnchor)
            .isActive = true
        navigationStackView.trailingAnchor.constraint(equalTo: questionsStackView.trailingAnchor)
            .isActive = true
        navigationStackView.topAnchor.constraint(equalTo: questionsStackView.bottomAnchor, constant: 20)
            .isActive = true
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
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath)
                    as? SearchTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath)
                    as? QuestionTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
}
