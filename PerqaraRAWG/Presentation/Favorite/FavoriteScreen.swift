//
//  FavoriteScreen.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class FavoriteScreen {
    
    static func build() -> FavoriteViewController {
        let viewModel = FavoriteViewModel()
        let viewController = FavoriteViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
