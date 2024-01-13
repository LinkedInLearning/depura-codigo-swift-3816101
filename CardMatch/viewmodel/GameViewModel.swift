//
//  GameViewModel.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import Foundation


class GameViewModel: ObservableObject {
    private static let cards = [Card(imageContent: "1"), Card(imageContent: "2"), Card(imageContent: "3"), Card(imageContent: "4"), Card(imageContent: "5"), Card(imageContent: "6") ]

    @Published private var game: Game = Game(cards: cards)
    
    
     var cards: [Card] {
        return game.cards
     }
    
    func selectCard(_ card: Card) {
        game.selectCard(card)
    }
    
    func shuffleCards() {
        game.shuffle()
    }
    
    func restart() {
        game.restart()
    }
}


