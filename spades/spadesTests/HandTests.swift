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
    
    func testSpadeScore() {
        let hand1 = Hand()
        hand1.cards.append(Card(rank: .Ace, suit: .Spade))
        hand1.cards.append(Card(rank: .King, suit: .Spade))
        XCTAssertEqual(hand1.spadeScore(), 2)
        
        let hand2 = Hand()
        hand2.cards.append(Card(rank: .King, suit: .Spade))
        hand2.cards.append(Card(rank: .Ten, suit: .Spade))
        hand2.cards.append(Card(rank: .Two, suit: .Spade))
        XCTAssertEqual(hand2.spadeScore(), 1)
        
        let hand3 = Hand()
        hand3.cards.append(Card(rank: .King, suit: .Spade))
        hand3.cards.append(Card(rank: .Nine, suit: .Spade))
        hand3.cards.append(Card(rank: .Six, suit: .Spade))
        hand3.cards.append(Card(rank: .Four, suit: .Spade))
        XCTAssertEqual(hand3.spadeScore(), 2)
        
        let hand4 = Hand()
        hand4.cards.append(Card(rank: .Nine, suit: .Spade))
        hand4.cards.append(Card(rank: .Eight, suit: .Spade))
        hand4.cards.append(Card(rank: .Six, suit: .Spade))
        hand4.cards.append(Card(rank: .Three, suit: .Spade))
        XCTAssertEqual(hand4.spadeScore(), 1)
        
        let hand5 = Hand()
        hand5.cards.append(Card(rank: .Ten, suit: .Spade))
        hand5.cards.append(Card(rank: .Five, suit: .Spade))
        hand5.cards.append(Card(rank: .Three, suit: .Spade))
        XCTAssertEqual(hand5.spadeScore(), 0)
		
		let hand6 = Hand()
		hand6.cards.append(Card(rank: .Ace, suit: .Spade))
		hand6.cards.append(Card(rank: .King, suit: .Spade))
		hand6.cards.append(Card(rank: .Jack, suit: .Spade))
		hand6.cards.append(Card(rank: .Nine, suit: .Spade))
		hand6.cards.append(Card(rank: .Four, suit: .Spade))
		hand6.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand6.spadeScore(), 4)
    }
	
	func testSpadeLeads() {
		let hand1 = Hand()
		hand1.cards.append(Card(rank: .Ace, suit: .Spade))
		hand1.cards.append(Card(rank: .King, suit: .Spade))
		XCTAssertEqual(hand1.spadeLeads(), 2)
		
		let hand2 = Hand()
		hand2.cards.append(Card(rank: .King, suit: .Spade))
		hand2.cards.append(Card(rank: .Ten, suit: .Spade))
		hand2.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand2.spadeLeads(), 1)
		
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .Ace, suit: .Spade))
		XCTAssertEqual(hand3.spadeLeads(), 1)
		
		let hand4 = Hand()
		hand4.cards.append(Card(rank: .Ace, suit: .Spade))
		hand4.cards.append(Card(rank: .King, suit: .Spade))
		hand4.cards.append(Card(rank: .Queen, suit: .Spade))
		hand4.cards.append(Card(rank: .Jack, suit: .Spade))
		hand4.cards.append(Card(rank: .Ten, suit: .Spade))
		hand4.cards.append(Card(rank: .Seven, suit: .Spade))
		hand4.cards.append(Card(rank: .Six, suit: .Spade))
		hand4.cards.append(Card(rank: .Five, suit: .Spade))
		hand4.cards.append(Card(rank: .Four, suit: .Spade))
		hand4.cards.append(Card(rank: .Three, suit: .Spade))
		hand4.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand4.spadeLeads(), 9)
		
		let hand5 = Hand()
		hand5.cards.append(Card(rank: .Queen, suit: .Spade))
		hand5.cards.append(Card(rank: .Jack, suit: .Spade))
		hand5.cards.append(Card(rank: .Seven, suit: .Spade))
		hand5.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand5.spadeLeads(), 2)
		
		let hand6 = Hand()
		hand6.cards.append(Card(rank: .Queen, suit: .Spade))
		hand6.cards.append(Card(rank: .Nine, suit: .Spade))
		hand6.cards.append(Card(rank: .Four, suit: .Spade))
		XCTAssertEqual(hand6.spadeLeads(), 1)
		
		let hand7 = Hand()
		hand7.cards.append(Card(rank: .Six, suit: .Spade))
		hand7.cards.append(Card(rank: .Five, suit: .Spade))
		hand7.cards.append(Card(rank: .Four, suit: .Spade))
		hand7.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand7.spadeLeads(), 0)
		
		let hand8 = Hand()
		hand8.cards.append(Card(rank: .Jack, suit: .Spade))
		hand8.cards.append(Card(rank: .Five, suit: .Spade))
		hand8.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand8.spadeLeads(), 0)
	}
	
	func testSpadeCount() {
		let hand1 = Hand()
		hand1.cards.append(Card(rank: .Ace, suit: .Spade))
		hand1.cards.append(Card(rank: .King, suit: .Spade))
		XCTAssertEqual(hand1.spadeCount(), 2)
		
		let hand2 = Hand()
		hand2.cards.append(Card(rank: .King, suit: .Spade))
		hand2.cards.append(Card(rank: .Ten, suit: .Spade))
		hand2.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand2.spadeCount(), 3)
		
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .King, suit: .Club))
		hand3.cards.append(Card(rank: .Nine, suit: .Diamond))
		hand3.cards.append(Card(rank: .Six, suit: .Heart))
		hand3.cards.append(Card(rank: .Four, suit: .Club))
		XCTAssertEqual(hand3.spadeCount(), 0)
		
		let hand4 = Hand()
		hand4.cards.append(Card(rank: .Ace, suit: .Spade))
		hand4.cards.append(Card(rank: .King, suit: .Spade))
		hand4.cards.append(Card(rank: .Queen, suit: .Spade))
		hand4.cards.append(Card(rank: .Jack, suit: .Spade))
		hand4.cards.append(Card(rank: .Ten, suit: .Spade))
		hand4.cards.append(Card(rank: .Nine, suit: .Spade))
		hand4.cards.append(Card(rank: .Eight, suit: .Spade))
		hand4.cards.append(Card(rank: .Seven, suit: .Spade))
		hand4.cards.append(Card(rank: .Six, suit: .Spade))
		hand4.cards.append(Card(rank: .Five, suit: .Spade))
		hand4.cards.append(Card(rank: .Four, suit: .Spade))
		hand4.cards.append(Card(rank: .Three, suit: .Spade))
		hand4.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand4.spadeCount(), 13)
		
		let hand5 = Hand()
		hand5.cards.append(Card(rank: .Ten, suit: .Club))
		hand5.cards.append(Card(rank: .Five, suit: .Spade))
		hand5.cards.append(Card(rank: .Three, suit: .Diamond))
		hand5.cards.append(Card(rank: .Ten, suit: .Heart))
		hand5.cards.append(Card(rank: .Four, suit: .Spade))
		hand5.cards.append(Card(rank: .Three, suit: .Spade))
		XCTAssertEqual(hand5.spadeCount(), 3)
	}
	
	func testCompareToHand(){
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .Ten, suit: .Club))
		hand3.cards.append(Card(rank: .Nine, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Diamond))
		hand3.cards.append(Card(rank: .Ten, suit: .Heart))
		hand3.cards.append(Card(rank: .Five, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Spade))
		var comparisonHandArray = [Card]()
		comparisonHandArray.append(Card(rank: .Ten, suit: .Club))
		comparisonHandArray.append(Card(rank: .Nine, suit: .Spade))
		comparisonHandArray.append(Card(rank: .Three, suit: .Diamond))
		comparisonHandArray.append(Card(rank: .Ten, suit: .Heart))
		comparisonHandArray.append(Card(rank: .Five, suit: .Spade))
		comparisonHandArray.append(Card(rank: .Three, suit: .Spade))
		XCTAssertTrue(hand3.compareToHand(originalHand:hand3.cards, comparisonHand: comparisonHandArray))
	}
	
	func testSuitArray(){
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .Ten, suit: .Club))
		hand3.cards.append(Card(rank: .Nine, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Diamond))
		hand3.cards.append(Card(rank: .Ten, suit: .Heart))
		hand3.cards.append(Card(rank: .Five, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Spade))
		let suitArray = hand3.suitArray(ofSuitType: .Spade)
		
		var comparisonHandArray = [Card]()
		comparisonHandArray.append(Card(rank: .Nine, suit: .Spade))
		comparisonHandArray.append(Card(rank: .Five, suit: .Spade))
		comparisonHandArray.append(Card(rank: .Three, suit: .Spade))
		XCTAssertTrue(hand3.compareToHand(originalHand:suitArray, comparisonHand: comparisonHandArray))
	}
	
	func testHighestRank() {
		let hand1 = Hand()
		hand1.cards.append(Card(rank: .Ace, suit: .Spade))
		hand1.cards.append(Card(rank: .King, suit: .Spade))
		XCTAssertEqual(hand1.highestRank(inSuitType:.Spade), .Ace)
		
		let hand2 = Hand()
		hand2.cards.append(Card(rank: .Two, suit: .Spade))
		hand2.cards.append(Card(rank: .King, suit: .Spade))
		hand2.cards.append(Card(rank: .Ten, suit: .Spade))
		XCTAssertEqual(hand2.highestRank(inSuitType:.Spade), .King)
		
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .Ten, suit: .Club))
		hand3.cards.append(Card(rank: .Nine, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Diamond))
		hand3.cards.append(Card(rank: .Ten, suit: .Heart))
		hand3.cards.append(Card(rank: .Five, suit: .Spade))
		hand3.cards.append(Card(rank: .Three, suit: .Spade))
		XCTAssertEqual(hand3.highestRank(inSuitType:.Spade), .Nine)
	}
}
