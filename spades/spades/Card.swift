//
//  Card.swift
//  spades
//
//  Created by Jennifer Anderson on 1/3/17.
//  Copyright © 2017 Jennifer Anderson. All rights reserved.
//

import Foundation

class Card: NSObject{
	var	rank: RankType?
	var suit: SuitType?
	
	enum SuitType {
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
	
}
