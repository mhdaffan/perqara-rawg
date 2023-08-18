//
//  GameDetailViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class GameDetailViewModel: BaseViewModel {
    
    @Injected(\.gamesUseCase) var gamesUseCase: GamesUseCase
    @Injected(\.coreDataUseCase) var coreDataUseCase: CoreDataUseCase
    
    var gameDetail: GameDetailModel?
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchGameDetail() {
        pullToRefresh?(true)
        gamesUseCase.fetchGameDetail(id: id) { [weak self] response in
            self?.pullToRefresh?(false)
            switch response {
            case .success(let game):
                self?.gameDetail = game
                self?.refreshData?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
    func isFavorite() -> Bool {
        coreDataUseCase.getFavoriteGame(id: id) != nil
    }
    
    func removeFromFavorite() {
        coreDataUseCase.deleteFavoriteGame(id: id)
    }
    
    func saveToFavorite(game: GameDetailModel) {
        coreDataUseCase.saveToFavoriteGame(game: game)
    }
    
}
