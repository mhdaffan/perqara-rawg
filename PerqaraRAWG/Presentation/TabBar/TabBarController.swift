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
        let home = UITabBarItem()
        home.image = .ic_home
        $0.tabBarItem = home
        $0.title = "Home"
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
        viewControllers = [homeViewController]
        selectedIndex = 0
    }
    
}
