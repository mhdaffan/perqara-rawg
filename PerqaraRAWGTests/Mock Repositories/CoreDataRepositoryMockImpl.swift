//
//  CoreDataRepositoryMockImpl.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

@testable import PerqaraRAWG

class CoreDataRepositoryMockImpl: CoreDataRepository {
    
    var favoriteGames: [Int: GameDetailModel] = [:]
    
    func getFavoriteGames() -> [Int: GameDetailModel] {
        return favoriteGames
    }
    
    func getFavoriteGame(id: Int) -> GameDetailModel? {
        return favoriteGames[id]
    }
    
    func saveToFavoriteGame(game: GameDetailModel) {
        favoriteGames[game.id] = game
    }
    
    func deleteFavoriteGame(id: Int) {
        favoriteGames.removeValue(forKey: id)
    }
    
}
