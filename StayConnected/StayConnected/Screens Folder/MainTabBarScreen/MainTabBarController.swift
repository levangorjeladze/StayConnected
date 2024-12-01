//
//  MainTabBarController.swift
//  StayConnected
//
//  Created by koba Sinauridze on 01.12.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupTabBar() {
        
        let homeScreen = HomeViewController()
        guard let homeImage = UIImage(systemName: "house"), let homeFilledImage = UIImage(systemName: "house.fill") else { return }
        homeScreen.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeFilledImage)
        
        let leaderBoardScreen = UIViewController()
        guard let leaderBoardImage = UIImage(systemName: "trophy"), let leaderBoarFilled = UIImage(systemName: "trophy.fill") else { return }
        leaderBoardScreen.tabBarItem = UITabBarItem(title: "LeaderBoard", image: leaderBoardImage, selectedImage: leaderBoarFilled)
        
        let profileScreen = UIViewController()
        guard let personImage = UIImage(systemName: "person"), let personFilledImage = UIImage(systemName: "person.fill") else {return }
        profileScreen.tabBarItem = UITabBarItem(title: "Profile", image: personImage, selectedImage: personFilledImage)
        
        let controllers = [homeScreen, leaderBoardScreen, profileScreen]
        
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        tabBar.backgroundColor = .systemGray5
        tabBar.tintColor = UIColor(hex: "#4E53A2")
        tabBar.layer.cornerRadius = 10
        tabBar.unselectedItemTintColor = .systemGray
    }
}
