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
        if let homeImage = UIImage(systemName: "house") {
            if let homeFilledImage = UIImage(systemName: "house.fill") {
                homeScreen.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeFilledImage)
            }
        }
        
        let leaderBoardScreen = UIViewController()
        if let leaderBoardImage = UIImage(systemName: "trophy") {
            if let leaderBoarFilled = UIImage(systemName: "trophy.fill") {
                leaderBoardScreen.tabBarItem = UITabBarItem(title: "LeaderBoard", image: leaderBoardImage, selectedImage: leaderBoarFilled)
            }
        }
        
        let profileScreen = UIViewController()
        if let personImage = UIImage(systemName: "person") {
            if let personFilledImage = UIImage(systemName: "person.fill") {
                profileScreen.tabBarItem = UITabBarItem(title: "Profile", image: personImage, selectedImage: personFilledImage)
            }
        }
        
        let controllers = [homeScreen, leaderBoardScreen, profileScreen]
        
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
        tabBar.backgroundColor = .systemGray5
        tabBar.tintColor = UIColor.black
        tabBar.layer.cornerRadius = 10
        tabBar.unselectedItemTintColor = UIColor(white: 0.3, alpha: 1.0)
    }
}
