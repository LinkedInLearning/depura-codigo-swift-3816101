//
//  Game.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import Foundation


struct Game {
    var cards: [Card]
    
   
    
    mutating func selectCard(_ card: Card) {
        if let cardIndex = cards.firstIndex(where: { c in c.imageContent == card.imageContent }) {
            cards.faceDownNotPaired()
            let otherCardIndex = cards.getFacedCardIndex()
            
            cards[cardIndex].isShown = cardIndex != otherCardIndex
            cards[cardIndex].isPaired = cards.areEquivalent(otherCardIndex!, cardIndex)
            if otherCardIndex != nil {
                cards[otherCardIndex!].isShown = cardIndex != otherCardIndex
                cards[otherCardIndex!].isPaired = cards.areEquivalent(otherCardIndex!, cardIndex)
            }
        }
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func restart() {
        self.cards.indices.forEach({
            cards[$0].isShown = false
        })
    }
    
}

extension [Card] {
    
    var moreThanOneCardFaced: Bool {
        let facedCards = filter { card in
            card.isShown && !card.isPaired
        }
        return facedCards.count > 1
    }
    
    
    func getFacedCardIndex() -> Index? {
        return firstIndex { card in
            card.isShown && !card.isPaired
        }
    }
    
    mutating func faceDownNotPaired() {
        if self.moreThanOneCardFaced {
            let index = self.enumerated().filter { index, card in
                return card.isShown && !card.isPaired
            }.map { index, _ in
                return index
            }
            index.forEach { i in
                self[i].isShown = false
            }
        }
    }
    
    func areEquivalent(_ index1: Index, _ index2: Index) -> Bool {
        self[index1].imageContent == self[index2].imageContent && index1 != index2
    }
    
}
