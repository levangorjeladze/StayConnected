//
//  SearchTableViewCell.swift
//  StayConnected
//
//  Created by koba Sinauridze on 01.12.24.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
    
    private let viewModel = HomeViewModel()
    
    static let identifier = "SearchCell"
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var searchTagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
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
        setupSearchBar()
        setupSearchTagCollectionView()
    }
    
    private func setupSearchBar() {
        contentView.addSubview(searchBar)
        
        searchBar.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            .isActive = true
        searchBar.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            .isActive = true
        searchBar.topAnchor.constraint(equalTo: contentView.topAnchor)
            .isActive = true
    }
    
    private func setupSearchTagCollectionView() {
        contentView.addSubview(searchTagCollectionView)
        
        searchTagCollectionView.leftAnchor.constraint(equalTo: searchBar.leftAnchor)
            .isActive = true
        searchTagCollectionView.rightAnchor.constraint(equalTo: searchBar.rightAnchor)
            .isActive = true
        searchTagCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15).isActive = true
        searchTagCollectionView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

}

extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getTagsCountForSearch()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath)
        as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: viewModel.getTagsForSearch(at: indexPath.row))
        return cell
    }
}
