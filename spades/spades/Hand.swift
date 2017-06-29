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
	
	/**
	Returns all the cards in the hand of the suit type
	*/
	func bid() -> Int {
		return 0
	}
	
	/**
	-rules to implement
		-spade count not more than 3
		-no ace or king
		-queen requires 2 more spades
		-jack requires 1 more spade
	*/
	func spadesAllowZero() -> Bool {
//		if(spadeCount() > 3)
//		{
//			return false
//		}
//		let spadeArray = suitArray(ofSuitType: .Spade)
//		for card in spadeArray {
//			if (card.rank == .Ace || card.rank == .King)
//			{
//				return false;
//			}
//		}
		return true
	}
	
	/**
	- If there's an ace, need at least 3 other cards.  If one card is a king, need at least 4 more cards
	- if there's a king need at least 2 other cards (not face values)
	*/
	func otherSuitsAllowZero() -> Bool {
		return true
	}
	
	/**
	Bidding zero and successfully getting zero points gives an extra 100 points, so this tests if the 0 is possible
	*/
	func shouldBidZero() -> Bool {
		return false
	}

// MARK: Helper methods
	
	/**
	Returns all the cards in the hand of the suit type
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
		let cardsOfSuit = suitArray(ofSuitType: inSuitType)
		let twoCard = Card(rank: .Two, suit: inSuitType)
		var highestCardRank = twoCard.rankScore()
		for card in cardsOfSuit
		{
			if card.rankScore() > highestCardRank
			{
				highestCardRank = card.rankScore()
			}
		}
		return twoCard.rankForScore(score: highestCardRank)
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
	
// MARK: Non Spade bid methods
	
	/**
	Returns the score for the cards in this hand of the passed in suit type
	*/
	func nonSpadeSuitScore(ofSuitType:Card.SuitType) -> Int {
		var score = 0
		if(ofSuitType == .Spade)
		{
			return score
		}
		
		let cardsForSuitType = suitArray(ofSuitType: ofSuitType)
		for card in cardsForSuitType {
			if(card.rank == .Ace)
			{
				score += 1
			}
			if(card.rank == .King && cardsForSuitType.count > 1)
			{
				score += 1
			}
		}
			
		return score
	}
	
// MARK: Spade bid methods
	
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
		var spadeScore = spadeLeads()
		
		if(spadeLeads() == 0)
		{
			if(spadeCount() == 4)
			{
				return 1
			}
			else if(spadeCount() == 5)
			{
				return 2
			}
			else if(spadeCount() == 6 || spadeCount() == 7)
			{
				return 3;
			}
		}
		
		
		let remainingSpades = spadeCount() - spadeLeads()
		if spadeCount() >= 4 {
			if((remainingSpades == 2 && spadeCount() > 2 ) || (remainingSpades == 3 &&  spadeCount() > 3)){
				spadeScore += 1
			}
			else if((remainingSpades == 4 && spadeCount() > 4 ) || (remainingSpades == 5 &&  spadeCount() > 5)){
				spadeScore += 2
			}
			else if((remainingSpades == 6 && spadeCount() > 6 ) || (remainingSpades == 7 &&  spadeCount() > 7)){
				spadeScore += 3
			}
		}

		return spadeScore
	}
	
	/**
	Calculates the number of spade leads we have.  Ace always counts as 1.  King counts as 1 if there's at least 1 spade, otherwise 0.  Queen counts as 1 if there's at least 2 other spades and so on
	*/
	func spadeLeads() -> Int {
		let spadeCount = self.spadeCount()
		var spadeLeads = 0
		for card in self.suitArray(ofSuitType:.Spade)
		{
			if card.rank == .Ace{
				spadeLeads += 1
			}
			if card.rank == .King && spadeCount >= 2{
				spadeLeads += 1
			}
			if card.rank == .Queen && spadeCount >= 3{
				spadeLeads += 1
			}
			if card.rank == .Jack && spadeCount >= 4{
				spadeLeads += 1
			}
			if card.rank == .Ten && spadeCount >= 5{
				spadeLeads += 1
			}
			if card.rank == .Nine && spadeCount >= 6{
				spadeLeads += 1
			}
			if card.rank == .Eight && spadeCount >= 7{
				spadeLeads += 1
			}
			if card.rank == .Seven && spadeCount >= 8{
				spadeLeads += 1
			}
			if card.rank == .Six && spadeCount >= 9{
				spadeLeads += 1
			}
			if card.rank == .Five && spadeCount >= 10{
				spadeLeads += 1
			}
			if card.rank == .Four && spadeCount >= 11{
				spadeLeads += 1
			}
			if card.rank == .Three && spadeCount >= 12{
				spadeLeads += 1
			}
			if card.rank == .Two && spadeCount >= 13{
				spadeLeads += 1
			}
		}
		return spadeLeads
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
}
