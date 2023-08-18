//
//  GameDetailViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

final class GameDetailViewModel: BaseViewModel {
    
    @Injected(\.gamesUseCase) var gamesUseCase: GamesUseCase
    
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
    
}
