//
//  Card.swift
//  TDDPokerByswift
//
//  Created by nagisa miura on 2020/04/13.
//  Copyright © 2020 nagisa miura. All rights reserved.
//

import Foundation

struct Card: Equatable {
    enum Suit: String {
        case spade   = "♠"
        case heart   = "♥"
        case club    = "♣"
        case diamond = "♦"
    }
    
    enum Rank: String {
        case ace   = "A"
        case two   = "2"
        case three = "3"
        case four  = "4"
        case five  = "5"
        case six   = "6"
        case seven = "7"
        case eight = "8"
        case nine  = "9"
        case ten   = "10"
        case jack  = "J"
        case queen = "Q"
        case king  = "K"
    }
    
    let rank: Rank
    let suit: Suit
    
    var notation: String {
        return rank.rawValue + suit.rawValue
    }
    
    func hasSameSuit(_ card: Card) -> Bool {
        return suit == card.suit
    }
    
    func hasSameRank(_ card: Card) -> Bool {
        return rank == card.rank
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.hasSameRank(rhs) && lhs.hasSameSuit(rhs)
    }
}
