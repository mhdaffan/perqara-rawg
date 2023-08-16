//
//  GameDetailScreen.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class GameDetailScreen {
    
    static func build(id: Int) -> GameDetailViewController {
        let viewModel = GameDetailViewModel(id: id)
        let viewController = GameDetailViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
