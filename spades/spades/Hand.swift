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
            if card.suit != .Spade {
                return false
            }
        }
        return true
    }
	
	/**
	*/
	func spadeScore() -> Int {
		return 0
	}
	
	/**
	*/
	func spadeCount() -> Int {
		var spadeCountInCards = 0
		for card in cards{
			if card.suit == .Spade{
				spadeCountInCards += 1
			}
		}
		return spadeCountInCards
	}
	
	/**
	*/
	func suitArray(ofSuitType:Card.SuitType) -> [Card] {
		let cardArray = [Card]()
		return cardArray
	}
	
	/**
	*/
	func highestRank(inSuitType:Card.SuitType) -> Card.RankType {
		return .Ace
	}

}
