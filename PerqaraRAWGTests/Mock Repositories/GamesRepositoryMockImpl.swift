//
//  GamesRepositoryMockImpl.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

struct GamesRepositoryMockImpl: GamesRepository {
    
    var fetchGamesResult: Result<Data?, Error> = .failure(DataTransferError.parsingJSON)
    var fetchGameDetailResult: Result<Data?, Error> = .failure(DataTransferError.parsingJSON)
    var searchGamesResult: Result<Data?, Error> = .failure(DataTransferError.parsingJSON)
    
    private let dataTransferService = DataTransferServiceMockImpl()
    
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        dataTransferService.response = fetchGamesResult
        dataTransferService.request(with: GamesEndpoint.gamesList(page: page), completion: completion)
    }
    
    func fetchGameDetail(id: Int, completion: @escaping (Result<GameDetailModel, Error>) -> Void) {
        dataTransferService.response = fetchGameDetailResult
        dataTransferService.request(with: GamesEndpoint.gameDetail(id: id), completion: completion)
    }
    
    func searchGames(page: Int, keyword: String, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        dataTransferService.response = searchGamesResult
        dataTransferService.request(with: GamesEndpoint.searchGames(page: page, keyword: keyword), completion: completion)
    }
    
}
