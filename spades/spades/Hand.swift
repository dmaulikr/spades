//
//  Hand.swift
//  spades
//
//  Created by Jennifer Anderson on 12/15/16.
//  Copyright © 2016 Jennifer Anderson. All rights reserved.
//

import Foundation

struct Card{
	let rank: RankType
	let score: ScoreType
	
	enum ScoreType {
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

class Hand: NSObject{
	
	func bid() -> Int {
		return 0
	}
}
