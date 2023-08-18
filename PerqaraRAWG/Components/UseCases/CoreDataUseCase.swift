//
//  CoreDataUseCase.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 18/08/23.
//

protocol CoreDataUseCase {
    func getFavoriteGames() -> [GameDetailModel]
    func getFavoriteGame(id: Int) -> GameDetailModel?
    func saveToFavoriteGame(game: GameDetailModel)
    func deleteFavoriteGame(id: Int)
}

struct CoreDataUseCaseImpl: CoreDataUseCase {
    
    @Injected(\.coreDataRepository) var coreDataRepository: CoreDataRepository
    
    func getFavoriteGames() -> [GameDetailModel] {
        return coreDataRepository.getFavoriteGames().map { $0.value }
    }
    
    func getFavoriteGame(id: Int) -> GameDetailModel? {
        return coreDataRepository.getFavoriteGame(id: id)
    }
    
    func saveToFavoriteGame(game: GameDetailModel) {
        coreDataRepository.saveToFavoriteGame(game: game)
    }
    
    func deleteFavoriteGame(id: Int) {
        coreDataRepository.deleteFavoriteGame(id: id)
    }
    
}
