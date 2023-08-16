//
//  HomeViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class HomeViewModel: BaseViewModel {
    
    @Injected(\.gamesUseCase) var gamesUseCase: GamesUseCase
    
    var gamesList: GamesListModel = GamesListModel(page: 1, games: [])
    
    func getGamesList() {
        guard gamesList.page > 0 else {
            return
        }
        
        gamesUseCase.fetchGamesList(page: gamesList.page) { [weak self] response in
            switch response {
            case .success(let gamesList):
                self?.gamesList.page = gamesList.page
                self?.gamesList.games.append(contentsOf: gamesList.games)
                self?.refreshData?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
}
