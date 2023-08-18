//
//  GameItemTableViewCellTest.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import XCTest
@testable import PerqaraRAWG

final class GameItemTableViewCellTest: XCTestCase {
    
    func test_init() {
        let sut = makeSUT()
        
        XCTAssertTrue(sut.contentView.contains(sut.iconImageView))
        XCTAssertTrue(sut.contentView.contains(sut.titleLabel))
        XCTAssertTrue(sut.contentView.contains(sut.releaseLabel))
        XCTAssertTrue(sut.contentView.contains(sut.starImageView))
        XCTAssertTrue(sut.contentView.contains(sut.ratingLabel))
    }
    
    func test_updateUI() {
        let sut = makeSUT()
        
        sut.updateUI(
            imageUrl: "",
            title: "Grand Theft Auto V",
            releaseDate: "2013-09-17",
            rating: String(4.47))
        
        XCTAssertEqual(sut.titleLabel.text, "Grand Theft Auto V")
        XCTAssertEqual(sut.releaseLabel.text, "Released date 2013-09-17")
        XCTAssertEqual(sut.ratingLabel.text, "4.47")
    }
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GameItemTableViewCell {
        let sut = GameItemTableViewCell()
        
        return sut
    }
    
}
