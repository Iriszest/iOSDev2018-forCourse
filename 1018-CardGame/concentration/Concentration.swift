//
//  Concentration.swift
//  concentration
//
//  Created by linx on 2018/10/17.
//  Copyright © 2018年 iris. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var score = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 20
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        //Shuffle the cards
        cards.sort{ _, _ in arc4random_uniform(2) == 0}
        
        /*
         Closure expression syntax has the following general form:
         
         { (parameters) -> return type in statements}
         
         */
    }
}
