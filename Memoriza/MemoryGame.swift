//
//  MemoryGame.swift
//  Memoriza
//
//  Created by Dev C Krishna on 25/08/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards : Array<Card>
    private var indexOfOneAndOnlyCardUp: Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {curr in curr.id == card.id})
            ,!cards[chosenIndex].isFaceUp
            ,!cards[chosenIndex].isMatched {
            if let potentialCardUp = indexOfOneAndOnlyCardUp {
                if cards[chosenIndex].content == cards[potentialCardUp].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialCardUp].isMatched = true
                }
                indexOfOneAndOnlyCardUp = nil
            }else{
                for index in 0..<cards.count{
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyCardUp = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
