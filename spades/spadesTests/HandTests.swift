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
    
    func testAceScore() {
        let hand1 = Hand()
        hand1.cards.append(Card(rank: .Ace, suit: .Spade))
        hand1.cards.append(Card(rank: .King, suit: .Spade))
        XCTAssertEqual(hand1.aceScore(), 2)
        
        let hand2 = Hand()
        hand2.cards.append(Card(rank: .King, suit: .Spade))
        hand2.cards.append(Card(rank: .Ten, suit: .Spade))
        hand2.cards.append(Card(rank: .Two, suit: .Spade))
        XCTAssertEqual(hand2.aceScore(), 1)
        
        let hand3 = Hand()
        hand3.cards.append(Card(rank: .King, suit: .Spade))
        hand3.cards.append(Card(rank: .Nine, suit: .Spade))
        hand3.cards.append(Card(rank: .Six, suit: .Spade))
        hand3.cards.append(Card(rank: .Four, suit: .Spade))
        XCTAssertEqual(hand3.aceScore(), 2)
        
        let hand4 = Hand()
        hand4.cards.append(Card(rank: .Nine, suit: .Spade))
        hand4.cards.append(Card(rank: .Eight, suit: .Spade))
        hand4.cards.append(Card(rank: .Six, suit: .Spade))
        hand4.cards.append(Card(rank: .Three, suit: .Spade))
        XCTAssertEqual(hand4.aceScore(), 1)
        
        let hand5 = Hand()
        hand5.cards.append(Card(rank: .Ten, suit: .Spade))
        hand5.cards.append(Card(rank: .Five, suit: .Spade))
        hand5.cards.append(Card(rank: .Three, suit: .Spade))
        XCTAssertEqual(hand5.aceScore(), 0)
    }
}
