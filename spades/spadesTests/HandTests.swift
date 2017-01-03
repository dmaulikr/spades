//
//  HandTests.swift
//  spades
//
//  Created by Jennifer Anderson on 12/15/16.
//  Copyright © 2016 Jennifer Anderson. All rights reserved.
//

import XCTest
@testable import spades

class HandTests: XCTestCase {
	var card: Card?
	
	override func setUp() {
		super.setUp()
		card = Card(rank: .Ace, score: .Heart)
	}
	
	func testBid() {
		let hand = Hand()
		let bid = hand.bid()
		XCTAssertEqual(bid, 0)
	}
	
	func testThatCardHasRank()
	{
		XCTAssertEqual(card!.rank, .Ace, "A card should always have a rank")
	}
	
	func testThatCardHasScore()
	{
		XCTAssertEqual(card!.score, .Heart, "A card should always have a score")
	}
	
	func testThatScoreIsLimitedToType()
	{
		card = Card(rank: .Ace, score: .Heart)
		XCTAssertEqual(card!.score, .Heart, "Heart is a correct card suit")
		card = Card(rank: .Ace, score: .Diamond)
		XCTAssertEqual(card!.score, .Diamond, "Diamond is a correct card suit")
		card = Card(rank: .Ace, score: .Spade)
		XCTAssertEqual(card!.score, .Spade, "Spade is a correct card suit")
		card = Card(rank: .Ace, score: .Club)
		XCTAssertEqual(card!.score, .Club, "Club is a correct card suit")
	}
	
	func testThatRankIsLimitedToType()
	{
		card = Card(rank: .Ace, score: .Heart)
		XCTAssertEqual(card!.rank, .Ace, "Ace is a correct card rank")
		card = Card(rank: .King, score: .Heart)
		XCTAssertEqual(card!.rank, .King, "King is a correct card rank")
		card = Card(rank: .Queen, score: .Heart)
		XCTAssertEqual(card!.rank, .Queen, "Queen is a correct card rank")
		card = Card(rank: .Jack, score: .Heart)
		XCTAssertEqual(card!.rank, .Jack, "Jack is a correct card rank")
		card = Card(rank: .Ten, score: .Heart)
		XCTAssertEqual(card!.rank, .Ten, "Ten is a correct card rank")
		card = Card(rank: .Nine, score: .Heart)
		XCTAssertEqual(card!.rank, .Nine, "Nine is a correct card rank")
		card = Card(rank: .Eight, score: .Heart)
		XCTAssertEqual(card!.rank, .Eight, "Eight is a correct card rank")
		card = Card(rank: .Seven, score: .Heart)
		XCTAssertEqual(card!.rank, .Seven, "Seven is a correct card rank")
		card = Card(rank: .Six, score: .Heart)
		XCTAssertEqual(card!.rank, .Six, "Six is a correct card rank")
		card = Card(rank: .Five, score: .Heart)
		XCTAssertEqual(card!.rank, .Five, "Five is a correct card rank")
		card = Card(rank: .Four, score: .Heart)
		XCTAssertEqual(card!.rank, .Four, "Four is a correct card rank")
		card = Card(rank: .Three, score: .Heart)
		XCTAssertEqual(card!.rank, .Three, "Three is a correct card rank")
		card = Card(rank: .Two, score: .Heart)
		XCTAssertEqual(card!.rank, .Two, "Two is a correct card rank")
	}

}
