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
        let card = Card(rank:.Ace, suit:.Heart)
		hand.cards.append(card)
		XCTAssertNotNil(hand.cards)
	}
	
	func testCardsInCardsArray(){
		let hand = Hand()
		let card = Card(rank:.Ace, suit:.Heart)
		hand.cards.append(card)
		XCTAssertTrue(hand.cards.contains { $0.suit == card.suit })
		XCTAssertTrue(hand.cards.contains { $0.rank == card.rank })
	}
	
	func testBid() {
		let hand = Hand()
		let bid = hand.bid()
		XCTAssertEqual(bid, 0)
	}
    
    func test13Bid() {
        let hand = Hand()
        hand.cards.append(Card(rank: .Ace, suit: .Spade))
        hand.cards.append(Card(rank: .King, suit: .Spade))
        hand.cards.append(Card(rank: .Queen, suit: .Spade))
        hand.cards.append(Card(rank: .Jack, suit: .Spade))
        hand.cards.append(Card(rank: .Ten, suit: .Spade))
        hand.cards.append(Card(rank: .Nine, suit: .Spade))
        hand.cards.append(Card(rank: .Eight, suit: .Spade))
        hand.cards.append(Card(rank: .Seven, suit: .Spade))
        hand.cards.append(Card(rank: .Six, suit: .Spade))
        hand.cards.append(Card(rank: .Five, suit: .Spade))
        hand.cards.append(Card(rank: .Four, suit: .Spade))
        hand.cards.append(Card(rank: .Three, suit: .Spade))
        hand.cards.append(Card(rank: .Two, suit: .Spade))
        let bid = hand.bid()
        XCTAssertEqual(bid, 13)
    }
}
