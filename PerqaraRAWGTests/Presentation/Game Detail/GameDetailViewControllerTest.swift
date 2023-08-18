//
//  GameDetailViewControllerTest.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class GameDetailViewControllerTest: XCTestCase {
    
    private lazy var gamesRepository = GamesRepositoryMockImpl()
    
    func test_viewDidLoad() {
        let sut = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.view.contains(sut.scrollView))
        XCTAssertTrue(sut.scrollView.contains(sut.contentView))
        XCTAssertEqual(sut.title, "Detail")
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GameDetailViewController {
        let viewModel = GameDetailViewModel(id: 4435)
        viewModel.gamesUseCase = GamesUseCaseMockImpl(gamesRepository: gamesRepository)
        let sut = GameDetailViewController(viewModel: viewModel)
        
        return sut
    }
    
}
