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
	
	func testThatCardHasRank()
	{
        let card = Card(rank: .Ace, suit: .Club)
		XCTAssertEqual(card.rank, .Ace, "A card should always have a rank")
	}
	
	func testThatCardHasScore()
	{
		let card = Card(rank: .Ace, suit: .Heart)
		XCTAssertEqual(card.suit, .Heart, "A card should always have a suit")
	}
	
	func testThatScoreIsLimitedToType()
	{
		XCTAssertEqual(Card(rank: .Ace, suit: .Heart).suit, .Heart, "Heart is a correct card suit")
        XCTAssertEqual(Card(rank: .Ace, suit: .Diamond).suit, .Diamond, "Diamond is a correct card suit")
        XCTAssertEqual(Card(rank: .Ace, suit: .Spade).suit, .Spade, "Spade is a correct card suit")
        XCTAssertEqual(Card(rank: .Ace, suit: .Club).suit, .Club, "Club is a correct card suit")
	}
	
	func testThatRankIsLimitedToType()
	{
        XCTAssertEqual(Card(rank: .Ace, suit: .Heart).rank, .Ace, "Ace is a correct card rank")
        XCTAssertEqual(Card(rank: .King, suit: .Heart).rank, .King, "King is a correct card rank")
        XCTAssertEqual(Card(rank: .Queen, suit: .Heart).rank, .Queen, "Queen is a correct card rank")
        XCTAssertEqual(Card(rank: .Jack, suit: .Heart).rank, .Jack, "Jack is a correct card rank")
        XCTAssertEqual(Card(rank: .Ten, suit: .Heart).rank, .Ten, "Ten is a correct card rank")
        XCTAssertEqual(Card(rank: .Nine, suit: .Heart).rank, .Nine, "Nine is a correct card rank")
        XCTAssertEqual(Card(rank: .Eight, suit: .Heart).rank, .Eight, "Eight is a correct card rank")
        XCTAssertEqual(Card(rank: .Seven, suit: .Heart).rank, .Seven, "Seven is a correct card rank")
        XCTAssertEqual(Card(rank: .Six, suit: .Heart).rank, .Six, "Six is a correct card rank")
        XCTAssertEqual(Card(rank: .Five, suit: .Heart).rank, .Five, "Five is a correct card rank")
        XCTAssertEqual(Card(rank: .Four, suit: .Heart).rank, .Four, "Four is a correct card rank")
        XCTAssertEqual(Card(rank: .Three, suit: .Heart).rank, .Three, "Three is a correct card rank")
        XCTAssertEqual(Card(rank: .Two, suit: .Heart).rank, .Two, "Two is a correct card rank")
    }
}
