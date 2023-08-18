//
//  FavoriteViewModelTest.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class FavoriteViewModelTest: XCTestCase {
    
    private var coreDataRepository = CoreDataRepositoryMockImpl()
    
    func test_getFavoriteGames_expectResult() {
        coreDataRepository.favoriteGames[4435] = GameDetailModel.mockModel()
        let sut = makeSUT()
        
        sut.getFavoriteGames()
        
        XCTAssertEqual(sut.data.count, 1)
    }
    
    func test_getFavoriteGames_expectEmpty() {
        coreDataRepository.favoriteGames = [:]
        let sut = makeSUT()
        
        sut.getFavoriteGames()
        
        XCTAssertTrue(sut.data.isEmpty)
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> FavoriteViewModel {
        let sut = FavoriteViewModel()
        sut.coreDataUseCase = CoreDataUseCaseMockImpl(coreDataRepository: coreDataRepository)
        
        return sut
    }
    
}
