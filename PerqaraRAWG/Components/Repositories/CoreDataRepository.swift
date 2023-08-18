//
//  CoreDataRepository.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 18/08/23.
//

protocol CoreDataRepository {
    func getFavoriteGames() -> [Int: GameDetailModel]
    func getFavoriteGame(id: Int) -> GameDetailModel?
    func saveToFavoriteGame(game: GameDetailModel)
    func deleteFavoriteGame(id: Int)
}

struct CoreDataRepositoryImpl: CoreDataRepository {
    
    func getFavoriteGames() -> [Int: GameDetailModel] {
        return UserDefaultsConfig.favoriteGames
    }
    
    func getFavoriteGame(id: Int) -> GameDetailModel? {
        return UserDefaultsConfig.favoriteGames[id]
    }
    
    func saveToFavoriteGame(game: GameDetailModel) {
        UserDefaultsConfig.favoriteGames[game.id] = game
    }
    
    func deleteFavoriteGame(id: Int) {
        UserDefaultsConfig.favoriteGames.removeValue(forKey: id)
    }
    
}
