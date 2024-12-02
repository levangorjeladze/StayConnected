//
//  AddQuestionViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

final class AddQuestionViewController: UIViewController {
    
    private let viewModel = AddQuestionViewModel()
    private var tagTitle: String?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Question"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(hex: "#4E53A2"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let questionSubjectTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        return textField
    }()
    
    private let questionSubjectLabel: UILabel = {
        let label = UILabel()
        label.text = "Subject:"
        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .lightGray
        return label
    }()
    
    private let tagsLabel: UILabel = {
        let label = UILabel()
        label.text = "Tags:"
        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .lightGray
        return label
    }()
    
    private let selectedTagsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let subjectStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let tagsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var tagsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: TagsCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let addQuestionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Add a question"
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .lightGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTitle()
        setupCancelButton()
        setupSubjectStackView()
        setupTagsStackView()
        setupCollectionView()
        setupTextView()
    }
    
    private func setupTitle() {
        view.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupCancelButton() {
        view.addSubview(cancelButton)
        
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func setupSubjectStackView() {
        view.addSubview(subjectStackView)
        subjectStackView.addArrangedSubview(questionSubjectLabel)
        subjectStackView.addArrangedSubview(questionSubjectTextField)
        
        
        subjectStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20 ).isActive = true
        subjectStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        subjectStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        questionSubjectTextField.widthAnchor.constraint(equalTo: questionSubjectLabel.widthAnchor, multiplier: 4).isActive = true
    }
    
    private func setupTagsStackView() {
        view.addSubview(tagsStackView)
        tagsStackView.addArrangedSubview(tagsLabel)
        tagsStackView.addArrangedSubview(selectedTagsStackView)
        
        tagsStackView.topAnchor.constraint(equalTo: subjectStackView.bottomAnchor, constant: 20 ).isActive = true
        tagsStackView.leftAnchor.constraint(equalTo: subjectStackView.leftAnchor).isActive = true
        tagsStackView.rightAnchor.constraint(equalTo: subjectStackView.rightAnchor).isActive = true
        
        selectedTagsStackView.widthAnchor.constraint(equalTo: tagsLabel.widthAnchor, multiplier: 4).isActive = true
    }
    
    private func setupCollectionView() {
        view.addSubview(tagsCollectionView)
        
        tagsCollectionView.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 20).isActive = true
        tagsCollectionView.leftAnchor.constraint(equalTo: subjectStackView.leftAnchor).isActive = true
        tagsCollectionView.rightAnchor.constraint(equalTo: subjectStackView.rightAnchor).isActive = true
        tagsCollectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func setupTextView() {
        view.addSubview(addQuestionTextView)
        
        addQuestionTextView.topAnchor.constraint(equalTo: tagsCollectionView.bottomAnchor, constant: 40).isActive = true
        addQuestionTextView.leftAnchor.constraint(equalTo: subjectStackView.leftAnchor).isActive = true
        addQuestionTextView.rightAnchor.constraint(equalTo: subjectStackView.rightAnchor).isActive = true
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func tagButtonTapped() {
        
    }
}

extension AddQuestionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getTagsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCollectionViewCell.identifier, for: indexPath)
                as? TagsCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: viewModel.getTag(at: indexPath.row))
        cell.tagButton.addTarget(self, action: #selector(tagButtonTapped), for: .touchUpInside)
        return cell
    }
    
    
}

#Preview {
    AddQuestionViewController()
}
