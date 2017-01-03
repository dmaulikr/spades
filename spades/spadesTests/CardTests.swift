//
//  CardTests.swift
//  spades
//
//  Created by Jennifer Anderson on 1/3/17.
//  Copyright © 2017 Jennifer Anderson. All rights reserved.
//

import XCTest
@testable import spades

class CardTests: XCTestCase {
	
	let card = Card()
	
	func testThatCardHasRank()
	{
		card.rank = .Ace
		XCTAssertEqual(card.rank, .Ace, "A card should always have a rank")
	}
	
	func testThatCardHasScore()
	{
		card.score = .Heart
		XCTAssertEqual(card.score, .Heart, "A card should always have a score")
	}
	
	func testThatScoreIsLimitedToType()
	{
		card.score = .Heart
		XCTAssertEqual(card.score, .Heart, "Heart is a correct card suit")
		card.score = .Diamond
		XCTAssertEqual(card.score, .Diamond, "Diamond is a correct card suit")
		card.score = .Spade
		XCTAssertEqual(card.score, .Spade, "Spade is a correct card suit")
		card.score = .Club
		XCTAssertEqual(card.score, .Club, "Club is a correct card suit")
	}
	
	func testThatRankIsLimitedToType()
	{
		card.rank = .Ace
		XCTAssertEqual(card.rank, .Ace, "Ace is a correct card rank")
		card.rank = .King
		XCTAssertEqual(card.rank, .King, "King is a correct card rank")
		card.rank = .Queen
		XCTAssertEqual(card.rank, .Queen, "Queen is a correct card rank")
		card.rank = .Jack
		XCTAssertEqual(card.rank, .Jack, "Jack is a correct card rank")
		card.rank = .Ten
		XCTAssertEqual(card.rank, .Ten, "Ten is a correct card rank")
		card.rank = .Nine
		XCTAssertEqual(card.rank, .Nine, "Nine is a correct card rank")
		card.rank = .Eight
		XCTAssertEqual(card.rank, .Eight, "Eight is a correct card rank")
		card.rank = .Seven
		XCTAssertEqual(card.rank, .Seven, "Seven is a correct card rank")
		card.rank = .Six
		XCTAssertEqual(card.rank, .Six, "Six is a correct card rank")
		card.rank = .Five
		XCTAssertEqual(card.rank, .Five, "Five is a correct card rank")
		card.rank = .Four
		XCTAssertEqual(card.rank, .Four, "Four is a correct card rank")
		card.rank = .Three
		XCTAssertEqual(card.rank, .Three, "Three is a correct card rank")
		card.rank = .Two
		XCTAssertEqual(card.rank, .Two, "Two is a correct card rank")
	}
}
