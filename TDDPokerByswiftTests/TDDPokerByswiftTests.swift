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
    
    /// 2枚のカードのrankが同じ時、pairの役が成立するか
    func testIsPair() {
        var card1: Card
        var card2: Card
        var hand: Hand
        
        card1 = Card(rank: .king, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand = Hand(cards: [card1, card2])
        XCTAssertTrue(hand.isPair)
        
        card1 = Card(rank: .queen, suit: .spade)
        card2 = Card(rank: .king, suit: .heart)
        hand = Hand(cards: [card1, card2])
        XCTAssertFalse(hand.isPair)
    }
    
    /// 2枚のカードのsuitが同じ時、Flushの役が成立するか
    func testIsFlush() {
        var card1: Card
        var card2: Card
        var hand: Hand
        
        card1 = Card(rank: .ace, suit: .heart)
        card2 = Card(rank: .queen, suit: .heart)
        hand = Hand(cards: [card1, card2])
        XCTAssertTrue(hand.isFlush)
        
        card1 = Card(rank: .ace, suit: .spade)
        card2 = Card(rank: .queen, suit: .heart)
        hand = Hand(cards: [card1, card2])
        XCTAssertFalse(hand.isFlush)
    }
}
