//
//  EmojiMemoryGame.swift
//  Memoriza
//
//  Created by Dev C Krishna on 25/08/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"]

    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: 4) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK - Intents(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
