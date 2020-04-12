//
//  TDDPokerByswiftTests.swift
//  TDDPokerByswiftTests
//
//  Created by nagisa miura on 2020/04/13.
//  Copyright © 2020 nagisa miura. All rights reserved.
//

import XCTest
@testable import TDDPokerByswift

class TDDPokerByswiftTests: XCTestCase {
    
    /// Cardのrankとsuitを元に、表示する文字列が合っているか
    func testCardNotation() {
        var card: Card
        card = Card(rank: .three, suit: .heart)
        XCTAssertEqual(card.notation, "3♥")
        
        card = Card(rank: .jack, suit: .spade)
        XCTAssertEqual(card.notation, "J♠")
    }
    
    func testHasSameSuit() {
        var card1: Card
        var card2: Card
        
        // suitが同じ時、trueを返す
        card1 = Card(rank: .ace, suit: .heart)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertTrue(card1.hasSameSuit(card2))
        
        // suitが違う時、falseを返す
        card1 = Card(rank: .ace, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertFalse(card1.hasSameSuit(card2))
    }
    
    func testHasSameRank() {
        var card1: Card
        var card2: Card
        
        // rankが同じ時、trueを返す
        card1 = Card(rank: .two, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertTrue(card1.hasSameRank(card2))
        
        // rankが違う時、falseを返す
        card1 = Card(rank: .ace, suit: .spade)
        card2 = Card(rank: .two, suit: .heart)
        XCTAssertFalse(card1.hasSameRank(card2))
    }
    
    func testCardEqual() {
        var card1: Card
        var card2: Card
        
        // rankとsuitが同じ
        card1 = Card(rank: .jack, suit: .club)
        card2 = Card(rank: .jack, suit: .club)
        XCTAssertEqual(card1, card2)
        
        // rankとsuitが異なる
        card1 = Card(rank: .queen, suit: .diamond)
        card2 = Card(rank: .jack, suit: .club)
        XCTAssertNotEqual(card1, card2)
        
        // rankが同じで、suitが異なる
        card1 = Card(rank: .jack, suit: .diamond)
        card2 = Card(rank: .jack, suit: .club)
        XCTAssertNotEqual(card1, card2)
        
        // rankが異なり、suitが同じ
        card1 = Card(rank: .queen, suit: .club)
        card2 = Card(rank: .jack, suit: .club)
        XCTAssertNotEqual(card1, card2)
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
