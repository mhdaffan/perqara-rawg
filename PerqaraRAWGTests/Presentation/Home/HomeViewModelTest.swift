//
//  HomeViewModel.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class HomeViewModelTest: XCTestCase {
    
    private lazy var gamesRepository = GamesRepositoryMockImpl()
    
    override func setUp() {
        super.setUp()
        
    }
    
    func test_getGamesList_expectError() {
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        var error: Error?
        
        sut.onError = { e in
            error = e
            exp.fulfill()
        }
        
        sut.getGamesList()
        
        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertNotNil(error)
        })
    }
    
    func test_getGamesList_expectSuccess() {
        gamesRepository.fetchGamesResult = .success(GamesListModel.mock())
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        
        sut.refreshData = {
            exp.fulfill()
        }
        
        sut.getGamesList()
        
        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertEqual(sut.data.page, 2)
            XCTAssertEqual(sut.data.games.count, 2)
        })
    }
    
    func test_searchGames_expectError() {
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        var error: Error?
        
        sut.onError = { e in
            error = e
            exp.fulfill()
        }
        
        sut.searchGames(keyword: "")
        
        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertNotNil(error)
        })
    }
    
    func test_searchGames_expectSuccess() {
        gamesRepository.searchGamesResult = .success(GamesListModel.mock())
        let sut = makeSUT()
        let exp = expectation(description: "waiting for response")
        
        sut.refreshData = {
            exp.fulfill()
        }
        
        sut.searchGames(keyword: "the wither")
        
        waitForExpectations(timeout: 0.1, handler: { _ in
            XCTAssertEqual(sut.data.page, 2)
            XCTAssertEqual(sut.data.games.count, 2)
        })
    }
    
    func test_resetData() {
        let sut = makeSUT()
        
        sut.resetData()
        
        XCTAssertEqual(sut.data.page, 1)
        XCTAssertTrue(sut.data.games.isEmpty)
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> HomeViewModel {
        let sut = HomeViewModel()
        sut.gamesUseCase = GamesUseCaseMockImpl(gamesRepository: gamesRepository)
        
        return sut
    }
    
}
