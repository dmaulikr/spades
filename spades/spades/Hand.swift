//
//  Hand.swift
//  spades
//
//  Created by Jennifer Anderson on 12/15/16.
//  Copyright © 2016 Jennifer Anderson. All rights reserved.
//

import Foundation

class Hand: NSObject{
	var cards = [Card]()
	
	func bid() -> Int {
        if(cards.count == 0)
        {
            return 0
        }
        if areAllCardsSpades(){
            return 13
        }
        else{
            return 0
        }
	}
    
    /**
     Requires the cards array to have more than 1 card
     */
    func areAllCardsSpades() -> Bool {
        for card in cards {
            if card.suit == .Spade {
                return false
            }
        }
        return true
    }
}
