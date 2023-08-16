//
//  HomeScreen.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class HomeScreen {
    
    static func build() -> HomeViewController {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
