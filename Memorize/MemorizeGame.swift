//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Susie Li on 12/26/24.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var score = 0
    
    // The cards in a new game should all start face down and shuffled.
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
    }
    
    var otherCard: Int? {
        get {
            cards.indices.filter {
                index in cards[index].isFaceUp && !cards[index].isMatched
            }.only
        }
        
        set {
            cards.indices.forEach { index in
                if !cards[index].isMatched {
                    cards[index].isFaceUp = (newValue == index)
                }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = otherCard {
                    cards[chosenIndex].flipCount += 1
                    cards[potentialMatchIndex].flipCount += 1
                    // Match Case
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isFaceUp = true
                        cards[potentialMatchIndex].isFaceUp = true
                        score += 2 // award 2 points for every match, whether or not the cards involved have been “previously seen”
                    } else if cards[chosenIndex].flipCount > 1 || cards[potentialMatchIndex].flipCount > 1 {
                        score -= 1 // penalize 1 point for every previously seen card that is involved in a mismatch
                    }
                } else {
                    otherCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: String
        var flipCount: Int = 0
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
