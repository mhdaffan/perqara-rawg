//
//  GameDetailViewTest.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class GameDetailViewTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT()
        
        XCTAssertTrue(sut.contains(sut.imageView))
        XCTAssertTrue(sut.contains(sut.publisherLabel))
        XCTAssertTrue(sut.contains(sut.titleLabel))
        XCTAssertTrue(sut.contains(sut.releaseLabel))
        XCTAssertTrue(sut.contains(sut.starImageView))
        XCTAssertTrue(sut.contains(sut.ratingLabel))
        XCTAssertTrue(sut.contains(sut.joystickImageView))
        XCTAssertTrue(sut.contains(sut.totalPlayLabel))
        XCTAssertTrue(sut.contains(sut.descriptionLabel))
    }
    
    func test_updateUI() {
        let sut = makeSUT()
        
        sut.updateUI(game: GameDetailModel(
            id: 4435,
            name: "MotorStorm RC",
            descriptionRaw: "Let go of the steering wheel, grab a remote control and let rip on a whole host of new tracks from classic MotorStorm® locations",
            released: "2012-02-22",
            backgroundImage: "https://media.rawg.io/media/games/825/82575be8cc9ea947a10dbdfd45c3b4d8.jpg",
            rating: 3.07,
            playtime: 5,
            publishers: [.init(id: 10212, name: "Sony Computer Entertainment")])
        )
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GameDetailView {
        let sut = GameDetailView()
        
        return sut
    }
    
}
