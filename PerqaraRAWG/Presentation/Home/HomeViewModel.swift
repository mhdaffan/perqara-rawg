//
//  HomeViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class HomeViewModel: BaseViewModel {
    
    @Injected(\.gamesUseCase) var gamesUseCase: GamesUseCase
    
    var data: GamesListModel = GamesListModel(page: 1, games: [])
    private var gamesList: GamesListModel = GamesListModel(page: 1, games: [])
    
    func getGamesList() {
        guard gamesList.page > 0 else {
            return
        }
        
        gamesUseCase.fetchGamesList(page: gamesList.page) { [weak self] response in
            switch response {
            case .success(let gamesList):
                self?.gamesList.page = gamesList.page
                self?.gamesList.games.append(contentsOf: gamesList.games)
                self?.data = self?.gamesList ?? GamesListModel(page: 1, games: [])
                self?.refreshData?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
    func searchGames(keyword: String) {
        guard gamesList.page > 0 else {
            return
        }
        
        gamesUseCase.searchGames(page: gamesList.page, keyword: keyword) { [weak self] response in
            switch response {
            case .success(let gamesList):
                self?.data.page = gamesList.page
                self?.data.games.append(contentsOf: gamesList.games)
                self?.refreshData?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
    func resetData() {
        data = GamesListModel(page: 1, games: [])
    }
    
    func switchToGameList() {
        data = gamesList
        refreshData?()
    }
    
}
