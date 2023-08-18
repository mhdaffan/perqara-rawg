//
//  GameDetailViewModelTest.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class GameDetailViewModelTest: XCTestCase {
    
    private var gamesRepository = GamesRepositoryMockImpl()
    private var coreDataRepository = CoreDataRepositoryMockImpl()
    
    func test_fetchGameDetail_expectError() {
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        var error: Error?

        sut.onError = { e in
            error = e
            exp.fulfill()
        }

        sut.fetchGameDetail()

        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertNotNil(error)
        })
    }
    
    func test_fetchGameDetail_expectSuccess() {
        gamesRepository.fetchGameDetailResult = .success(GameDetailModel.mock())
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        
        sut.refreshData = {
            exp.fulfill()
        }
        
        sut.fetchGameDetail()
        
        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertNotNil(sut.gameDetail)
            XCTAssertEqual(sut.gameDetail?.id, 4435)
            XCTAssertEqual(sut.gameDetail?.name, "MotorStorm RC")
        })
    }
    
    func test_removeFromFavorite() {
        let sut = makeSUT()
        sut.saveToFavorite(game: GameDetailModel.mockModel())
        
        sut.removeFromFavorite()
        
        XCTAssertFalse(sut.isFavorite())
    }
    
    func test_saveToFavorite() {
        let sut = makeSUT()
        
        sut.saveToFavorite(game: GameDetailModel.mockModel())
        
        XCTAssertTrue(sut.isFavorite())
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GameDetailViewModel {
        let sut = GameDetailViewModel(id: 4435)
        sut.gamesUseCase = GamesUseCaseMockImpl(gamesRepository: gamesRepository)
        
        return sut
    }
    
}
