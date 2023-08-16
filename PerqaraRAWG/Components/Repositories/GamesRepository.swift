//
//  GamesRepository.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Foundation

protocol GamesRepository {
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void)
}

struct GamesRepositoryImpl: GamesRepository {
    
    @Injected(\.dataTransferService) var dataTransferService: DataTransferService
    
    func fetchGamesList(page: Int, completion: @escaping (Result<GamesListModel, Error>) -> Void) {
        dataTransferService.request(with: GamesEndpoint.gamesList(page: page), completion: completion)
    }
    
}
