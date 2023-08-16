//
//  GamesRepository.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Foundation

protocol GamesRepository {
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void)
    func fetchGameDetail(id: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void)
    func searchGames(page: Int, keyword: String, completion: @escaping (Result<GamesListModel, Error>) -> Void)
}

struct GamesRepositoryImpl: GamesRepository {
    
    @Injected(\.dataTransferService) var dataTransferService: DataTransferService
    
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        dataTransferService.request(with: GamesEndpoint.gamesList(page: page), completion: completion)
    }
    
    func fetchGameDetail(id: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void) {
        dataTransferService.request(with: GamesEndpoint.gameDetail(id: id), completion: completion)
    }
    
    func searchGames(page: Int, keyword: String, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        dataTransferService.request(with: GamesEndpoint.searchGames(page: page, keyword: keyword), completion: completion)
    }
}
