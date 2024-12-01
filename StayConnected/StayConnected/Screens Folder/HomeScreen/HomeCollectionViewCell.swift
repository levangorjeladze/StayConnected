//
//  HomeCollectionViewCell.swift
//  StayConnected
//
//  Created by koba Sinauridze on 01.12.24.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SearchTagCell"
    private var tagButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(hex: "#4E53A2"), for: .normal)
        button.backgroundColor = UIColor(hex: "#EEF2FF")
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        contentView.addSubview(tagButton)
        
        tagButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tagButton.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        tagButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tagButton.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    func configure(with tagTitle: String) {
        tagButton.setTitle("    \(tagTitle)    ", for: .normal)
    }
}

