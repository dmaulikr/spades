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
		card = Card(rank: "A", score: .H)
	}
	
	func testBid() {
		let hand = Hand()
		let bid = hand.bid()
		XCTAssertEqual(bid, 0)
	}
	
	func testThatCardHasRank()
	{
		XCTAssertEqual(card!.rank, "A", "A card should always have a rank")
	}
	
	func testThatCardHasScore()
	{
		XCTAssertEqual(card!.score, .H, "A card should always have a score")
	}
	
	func testThatScoreIsLimitedToType()
	{
		XCTAssertEqual(card!.score, .H, "H is a correct card suit")
		card = Card(rank: "A", score: .D)
		XCTAssertEqual(card!.score, .D, "D is a correct card suit")
		card = Card(rank: "A", score: .S)
		XCTAssertEqual(card!.score, .S, "S is a correct card suit")
		card = Card(rank: "A", score: .C)
		XCTAssertEqual(card!.score, .C, "S is a correct card suit")
	}

}
