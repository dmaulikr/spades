//
//  Card.swift
//  spades
//
//  Created by Jennifer Anderson on 1/3/17.
//  Copyright © 2017 Jennifer Anderson. All rights reserved.
//

import Foundation

class Card: NSObject{
	let	rank: RankType
	let suit: SuitType
	
	enum SuitType: Int {
		case Heart
		case Diamond
		case Spade
		case Club
	}
	
	enum RankType {
		case Ace
		case King
		case Queen
		case Jack
		case Ten
		case Nine
		case Eight
		case Seven
		case Six
		case Five
		case Four
		case Three
		case Two
	}
	
    init(rank:RankType, suit:SuitType) {
        self.rank = rank
        self.suit = suit
    }
	
	/**
	@brief Returns the numerical power of the card rank
	*/
	func rankScore() -> NSInteger
	{
		var returnScore = -1;
		
		switch self.rank
		{
		case .Ace:
			returnScore = 14
		case .King:
			returnScore = 13
		case .Queen:
			returnScore = 12
		case .Jack:
			returnScore = 11
		case .Ten:
			returnScore = 10
		case .Nine:
			returnScore = 9
		case .Eight:
			returnScore = 8
		case .Seven:
			returnScore = 7
		case .Six:
			returnScore = 6
		case .Five:
			returnScore = 5
		case .Four:
			returnScore = 4
		case .Three:
			returnScore = 3
		case .Two:
			returnScore = 2
		}
		return returnScore
	}
	
	/**
	@brief Returns the numerical power of the card rank
	*/
	func rankForScore(score:NSInteger) -> RankType
	{
		switch score
		{
			case 14:
				return .Ace
			
			case 13:
				return .King
			
			case 12:
				return .Queen
			
			case 11:
				return .Jack
			
			case 10:
				return .Ten
			
			case 9:
				return .Nine
			
			case 8:
				return .Eight
			
			case 7:
				return .Seven
			
			case 6:
				return .Six
			
			case 5:
				return .Five
			
			case 4:
				return .Four
			
			case 3:
				return .Three
			
			case 2:
				return .Two
			
			default:
				return .Two
			
		}
	}
	
	/**
	@brief Returns the numerical power of the card suit
	*/
	func suitScore() -> NSInteger
	{
		var returnScore = -1;
		
		switch self.suit
		{
		case .Heart:
			returnScore = 1
		case .Diamond:
			returnScore = 2
		case .Spade:
			returnScore = 3
		case .Club:
			returnScore = 4
		}
		return returnScore
	}
	
	func compareToCard(comparisonCard:Card) -> Bool
	{
		let ranksEqual = rankScore() == comparisonCard.rankScore()
		let suitsEqual = suitScore() == comparisonCard.suitScore()
		if ranksEqual && suitsEqual
		{
			return true
		}
		return false
	}

}
