//
//  TabBarController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 15/08/23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    static let shared = TabBarController()
    
    private let homeViewController = HomeScreen.build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        tabBar.layer.borderWidth = 1
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = .blue
        let unselectedFontAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        UITabBarItem.appearance().setTitleTextAttributes(unselectedFontAttribute, for: .normal)
        
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        let home = UITabBarItem()
        home.image = .ic_home
        homeViewController.tabBarItem = home
        homeViewController.title = "Home"
        
        viewControllers = [homeViewController]
        selectedIndex = 0
    }
    
}
