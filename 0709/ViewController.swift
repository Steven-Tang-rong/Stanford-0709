//
//  ViewController.swift
//  0709
//
//  Created by TANG,QI-RONG on 2020/7/9.
//  Copyright © 2020 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   lazy var game = concentration(numberOfPairsOfCards: (myCardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "次數: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var myCardButtons: [UIButton]!
    
    
    @IBAction func showTheGhost(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = myCardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber)")
        }else {
            print("Chosen card was not in cardButton")
        }
        
    }
    
    func updateViewFromModel() {
        for index in myCardButtons.indices {
            let button = myCardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9983078837, green: 0.9106715322, blue: 0.8389384151, alpha: 1)

            }else {
                button.setTitle(" ", for: UIControl.State.normal)
                button.backgroundColor = card.ismatched ? #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 0) : #colorLiteral(red: 0.6125019979, green: 0.8612744488, blue: 0.9806472081, alpha: 1)
                print("success II")
            }
        }
    }

    var emojiChoices = ["👻", "👽", "🦾", "😱", "😈", "🍎", "🎲", "🧩"]
    var emoji = [Int: String]()
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }


}

