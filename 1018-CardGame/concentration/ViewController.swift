//
//  ViewController.swift
//  concentration
//
//  Created by iris on 2018/9/16.
//  Copyright © 2018年 iris. All rights reserved.
//  卡牌游戏

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    //flipcount来代表chances
    var chance: Int = 10 {
        didSet{
            if chance >= 0{
                flipCountLabel.text = "Chances: \(chance)"
                scoreLabel.text = "Score: \(game.score)"
            }
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func flipCard(_ sender: UIButton) {
        chance -= 1
        if chance > 0 {
            if let cardNum = cardButtons.index(of: sender){
                game.chooseCard(at: cardNum)
                updateViewFromModel()
            } else {
                print("Chosen card was not in cardButtons!")
            }
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.7006510644, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojiChoices: [String] = ["🐶","🐰","🙈","🐹","🐟","🐼","🦆"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) ->String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
}

