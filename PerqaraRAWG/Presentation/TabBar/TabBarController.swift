//
//  TabBarController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 15/08/23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    static let shared = TabBarController()
    
    private let homeViewController = HomeScreen.build().then {
        $0.title = "Games For You"
        $0.tabBarItem = UITabBarItem(title: "Home", image: .ic_home, tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        tabBar.layer.borderWidth = 1
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = .darkGray
        
        let unselectedFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)]
        UITabBarItem.appearance().setTitleTextAttributes(unselectedFontAttribute, for: .normal)
        
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        viewControllers = [UINavigationController(rootViewController: homeViewController)]
        selectedIndex = 0
    }
    
}
