//
//  GamesUseCase.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

protocol GamesUseCase {
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void)
    func fetchGameDetail(id: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void)
    func searchGames(page: Int, keyword: String, completion: @escaping (Result<GamesListModel, Error>) -> Void)
}

class GamesUseCaseImpl: GamesUseCase {
    
    @Injected(\.gamesRepository) var gamesRepository: GamesRepository
    
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        gamesRepository.fetchGamesList(page: page) { response in
            switch response {
            case .success(var gamesList):
                if gamesList.next != nil {
                    gamesList.page += 1
                } else {
                    gamesList.page = 0
                }
                completion(.success(gamesList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchGameDetail(id: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void) {
        gamesRepository.fetchGameDetail(id: id, completion: completion)
    }
    
    func searchGames(page: Int, keyword: String, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        gamesRepository.searchGames(page: page, keyword: keyword) { response in
            switch response {
            case .success(var gamesList):
                if gamesList.next != nil {
                    gamesList.page += 1
                } else {
                    gamesList.page = 0
                }
                completion(.success(gamesList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
