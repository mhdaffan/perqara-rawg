//
//  FavoriteViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class FavoriteViewModel: BaseViewModel {
    
    @Injected(\.coreDataUseCase) var coreDataUseCase: CoreDataUseCase
    
    var data: [GameDetailModel] = []
    
    func getFavoriteGames() {
        data = coreDataUseCase.getFavoriteGames()
        refreshData?()
    }
    
}
