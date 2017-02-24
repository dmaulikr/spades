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
		var cardArray = [Card]()
		for card in cards
		{
			if card.suit == ofSuitType
			{
				cardArray.append(card)
			}
		}
		return cardArray
	}
	
	/**
	*/
	func highestRank(inSuitType:Card.SuitType) -> Card.RankType {
		return .Ace
	}
	
	/**
	For now, assumes the same order for hands
	*/
	func compareToHand(originalHand:[Card], comparisonHand:[Card]) -> Bool {
		var index = 0
		let comparisonHandCount = comparisonHand.count
		for card1 in originalHand {
			if(comparisonHandCount > index)
			{
				let comparisonHandCard = comparisonHand[index]
				if !card1.compareToCard(comparisonCard: comparisonHandCard)
				{
					return false
				}
				index += 1
			}
			else
			{
				return true
			}
		}
		return true
	}

}
