//
//  Hand.swift
//  spades
//
//  Created by Jennifer Anderson on 12/15/16.
//  Copyright © 2016 Jennifer Anderson. All rights reserved.
//

import Foundation

struct Card{
	let rank: String
	let score: ScoreType
	
	//Heart, Diamond, Spade, Club
	enum ScoreType {
		case H
		case D
		case S
		case C
	}
}

class Hand: NSObject{
	
	func bid() -> Int {
		return 0
	}
}
