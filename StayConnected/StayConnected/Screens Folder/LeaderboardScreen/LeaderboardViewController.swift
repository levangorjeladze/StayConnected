//
//  LeaderboardViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

class LeaderboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Leaderboard"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
