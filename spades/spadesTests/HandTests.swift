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
	
	override func setUp() {
		super.setUp()
	}
	
	func testCardsArrayExists(){
		let hand = Hand()
		let card = Card()
		hand.cards.append(card)
		XCTAssertNotNil(hand.cards)
	}
	
	func testCardsInCardsArray(){
		let hand = Hand()
		let card = Card()
		card.rank = .Ace
		card.suit = .Heart
		hand.cards.append(card)
		XCTAssertTrue(hand.cards.contains { $0.suit == card.suit })
		XCTAssertTrue(hand.cards.contains { $0.rank == card.rank })
	}
	
	func testBid() {
		let hand = Hand()
		let bid = hand.bid()
		XCTAssertEqual(bid, 0)
	}
}
