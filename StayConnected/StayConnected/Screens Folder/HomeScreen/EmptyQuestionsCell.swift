//
//  EmptyQuestionsCell.swift
//  StayConnected
//
//  Created by koba Sinauridze on 05.12.24.
//

import UIKit

final class EmptyQuestionsCell: UITableViewCell {
    
    static let identifier = "EmptyQuestionsCell"
    
    private let emptyLabelOne: UILabel = {
        let label = UILabel()
        label.text = "No questions yet"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emptyLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "Be the first to ask one."
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageForEmptyCell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "EmptyQuestions")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(emptyLabelOne)
        contentView.addSubview(emptyLabelTwo)
        contentView.addSubview(imageForEmptyCell)
        
        emptyLabelOne.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        emptyLabelOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        emptyLabelOne.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        emptyLabelTwo.topAnchor.constraint(equalTo: emptyLabelOne.bottomAnchor, constant: 10).isActive = true
        emptyLabelTwo.leadingAnchor.constraint(equalTo: emptyLabelOne.leadingAnchor).isActive = true
        emptyLabelTwo.trailingAnchor.constraint(equalTo: emptyLabelOne.trailingAnchor).isActive = true

        imageForEmptyCell.topAnchor.constraint(equalTo: emptyLabelTwo.bottomAnchor, constant: 10).isActive = true
        imageForEmptyCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageForEmptyCell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageForEmptyCell.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
