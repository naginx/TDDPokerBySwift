//
//  Hand.swift
//  TDDPokerByswift
//
//  Created by nagisa miura on 2020/04/15.
//  Copyright © 2020 nagisa miura. All rights reserved.
//

import Foundation

struct Hand {
    let cards: [Card]
    
    var isPair: Bool {
        return cards[0].rank == cards[1].rank
    }
    
    var isFlush: Bool {
        return cards[0].suit == cards[1].suit
    }
}
