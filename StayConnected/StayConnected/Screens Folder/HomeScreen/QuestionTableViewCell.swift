//
//  QuestionTableViewCell.swift
//  StayConnected
//
//  Created by koba Sinauridze on 01.12.24.
//

import UIKit

final class QuestionTableViewCell: UITableViewCell {

    let viewModel = HomeViewModel()
    var tags: [Tag] = []
    
    static let identifier = "QuestionCell"

    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let badgeAndReplyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let questionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        return label
    }()
    
    var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .label
        label.numberOfLines = 2
        return label

    }()
    
    var repliesLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupStackViews()
    }

    private func setupView() {
        contentView.addSubview(view)
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupStackViews() {
        contentView.addSubview(questionStackView)
        questionStackView.addArrangedSubview(detailStackView)
        questionStackView.addArrangedSubview(badgeAndReplyStackView)
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(questionLabel)
        detailStackView.addArrangedSubview(tagCollectionView)
        badgeAndReplyStackView.addArrangedSubview(repliesLabel)
        
        questionStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        questionStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        questionStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        questionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        detailStackView.widthAnchor.constraint(equalTo: badgeAndReplyStackView.widthAnchor, multiplier: 4).isActive = true
    }
}

extension QuestionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath)
        as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: tags[indexPath.row].name)
        return cell
    }
}
