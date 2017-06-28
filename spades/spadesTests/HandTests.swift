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
	
	func testBid(){
		let hand1 = Hand()
		hand1.cards.append(Card(rank: .Ace, suit: .Heart))
		hand1.cards.append(Card(rank: .Queen, suit: .Heart))
		hand1.cards.append(Card(rank: .Nine, suit: .Heart))
		hand1.cards.append(Card(rank: .Two, suit: .Heart))
		hand1.cards.append(Card(rank: .King, suit: .Spade))
		hand1.cards.append(Card(rank: .Ten, suit: .Spade))
		hand1.cards.append(Card(rank: .Six, suit: .Spade))
		hand1.cards.append(Card(rank: .Four, suit: .Spade))
		hand1.cards.append(Card(rank: .Queen, suit: .Diamond))
		hand1.cards.append(Card(rank: .Four, suit: .Diamond))
		hand1.cards.append(Card(rank: .Three, suit: .Diamond))
		hand1.cards.append(Card(rank: .Seven, suit: .Club))
		hand1.cards.append(Card(rank: .Five, suit: .Club))
		XCTAssertEqual(hand1.bid(), 3)
		
		let hand2 = Hand()
		hand2.cards.append(Card(rank: .Jack, suit: .Heart))
		hand2.cards.append(Card(rank: .Eight, suit: .Heart))
		hand2.cards.append(Card(rank: .Five, suit: .Heart))
		hand2.cards.append(Card(rank: .Three, suit: .Heart))
		hand2.cards.append(Card(rank: .Queen, suit: .Spade))
		hand2.cards.append(Card(rank: .Nine, suit: .Spade))
		hand2.cards.append(Card(rank: .Eight, suit: .Spade))
		hand2.cards.append(Card(rank: .Three, suit: .Spade))
		hand2.cards.append(Card(rank: .Two, suit: .Spade))
		hand2.cards.append(Card(rank: .Eight, suit: .Diamond))
		hand2.cards.append(Card(rank: .Seven, suit: .Diamond))
		hand2.cards.append(Card(rank: .Six, suit: .Diamond))
		hand2.cards.append(Card(rank: .Seven, suit: .Club))
		XCTAssertEqual(hand2.bid(), 3)
		
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .King, suit: .Heart))
		hand3.cards.append(Card(rank: .Ten, suit: .Heart))
		hand3.cards.append(Card(rank: .Five, suit: .Heart))
		hand3.cards.append(Card(rank: .Ace, suit: .Spade))
		hand3.cards.append(Card(rank: .Nine, suit: .Spade))
		hand3.cards.append(Card(rank: .Six, suit: .Spade))
		hand3.cards.append(Card(rank: .King, suit: .Diamond))
		hand3.cards.append(Card(rank: .Nine, suit: .Diamond))
		hand3.cards.append(Card(rank: .Seven, suit: .Diamond))
		hand3.cards.append(Card(rank: .Six, suit: .Diamond))
		hand3.cards.append(Card(rank: .Three, suit: .Diamond))
		hand3.cards.append(Card(rank: .Ace, suit: .Club))
		hand3.cards.append(Card(rank: .Two, suit: .Club))
		XCTAssertEqual(hand3.bid(), 4)
		
		let hand4 = Hand()
		hand4.cards.append(Card(rank: .King, suit: .Heart))
		hand4.cards.append(Card(rank: .Ten, suit: .Heart))
		hand4.cards.append(Card(rank: .Five, suit: .Heart))
		hand4.cards.append(Card(rank: .Four, suit: .Heart))
		hand4.cards.append(Card(rank: .Two, suit: .Spade))
		hand4.cards.append(Card(rank: .Queen, suit: .Spade))
		hand4.cards.append(Card(rank: .Jack, suit: .Spade))
		hand4.cards.append(Card(rank: .Nine, suit: .Spade))
		hand4.cards.append(Card(rank: .King, suit: .Diamond))
		hand4.cards.append(Card(rank: .Ace, suit: .Diamond))
		hand4.cards.append(Card(rank: .Jack, suit: .Diamond))
		hand4.cards.append(Card(rank: .Seven, suit: .Club))
		hand4.cards.append(Card(rank: .Five, suit: .Club))
		XCTAssertEqual(hand4.bid(), 3)
		
		let hand5 = Hand()
		hand5.cards.append(Card(rank: .Ten, suit: .Heart))
		hand5.cards.append(Card(rank: .Seven, suit: .Heart))
		hand5.cards.append(Card(rank: .Four, suit: .Heart))
		hand5.cards.append(Card(rank: .Seven, suit: .Heart))
		hand5.cards.append(Card(rank: .Five, suit: .Spade))
		hand5.cards.append(Card(rank: .Three, suit: .Spade))
		hand5.cards.append(Card(rank: .King, suit: .Spade))
		hand5.cards.append(Card(rank: .Queen, suit: .Spade))
		hand5.cards.append(Card(rank: .Seven, suit: .Diamond))
		hand5.cards.append(Card(rank: .Five, suit: .Diamond))
		hand5.cards.append(Card(rank: .Four, suit: .Diamond))
		hand5.cards.append(Card(rank: .Nine, suit: .Club))
		hand5.cards.append(Card(rank: .Seven, suit: .Club))
		XCTAssertEqual(hand5.bid(), 0)
	}
	
	func testNonSpadeSuitScore(){
		let hand1 = Hand()
		hand1.cards.append(Card(rank: .Ace, suit: .Heart))
		hand1.cards.append(Card(rank: .Queen, suit: .Heart))
		hand1.cards.append(Card(rank: .Nine, suit: .Heart))
		hand1.cards.append(Card(rank: .Two, suit: .Heart))
		XCTAssertEqual(hand1.nonSpadeSuitScore(ofSuitType:.Heart), 1)
		
		let hand2 = Hand()
		hand2.cards.append(Card(rank: .Seven, suit: .Heart))
		XCTAssertEqual(hand2.nonSpadeSuitScore(ofSuitType:.Heart), 0)
		
		let hand3 = Hand()
		hand3.cards.append(Card(rank: .Jack, suit: .Diamond))
		hand3.cards.append(Card(rank: .Two, suit: .Diamond))
		XCTAssertEqual(hand3.nonSpadeSuitScore(ofSuitType:.Diamond), 0)
		
		let hand4 = Hand()
		hand4.cards.append(Card(rank: .Ace, suit: .Spade))
		hand4.cards.append(Card(rank: .King, suit: .Spade))
		hand4.cards.append(Card(rank: .Queen, suit: .Spade))
		XCTAssertEqual(hand4.nonSpadeSuitScore(ofSuitType:.Spade), 0)
		
		let hand5 = Hand()
		hand5.cards.append(Card(rank: .Ace, suit: .Club))
		hand5.cards.append(Card(rank: .King, suit: .Club))
		hand5.cards.append(Card(rank: .Ten, suit: .Club))
		hand5.cards.append(Card(rank: .Nine, suit: .Club))
		XCTAssertEqual(hand5.nonSpadeSuitScore(ofSuitType:.Club), 2)
		
		let hand6 = Hand()
		hand6.cards.append(Card(rank: .King, suit: .Club))
		XCTAssertEqual(hand6.nonSpadeSuitScore(ofSuitType:.Club), 0)
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
		XCTAssertEqual(hand6.spadeScore(), 5)
		
		let hand7 = Hand()
		hand7.cards.append(Card(rank: .Four, suit: .Spade))
		hand7.cards.append(Card(rank: .Five, suit: .Spade))
		XCTAssertEqual(hand7.spadeScore(), 0)
		
		let hand8 = Hand()
		XCTAssertEqual(hand8.spadeScore(), 0)
		
		let hand9 = Hand()
		hand9.cards.append(Card(rank: .Queen, suit: .Spade))
		hand9.cards.append(Card(rank: .Five, suit: .Spade))
		hand9.cards.append(Card(rank: .Three, suit: .Spade))
		XCTAssertEqual(hand9.spadeScore(), 1)
		
		let hand10 = Hand()
		hand10.cards.append(Card(rank: .King, suit: .Spade))
		hand10.cards.append(Card(rank: .Queen, suit: .Spade))
		hand10.cards.append(Card(rank: .Jack, suit: .Spade))
		hand10.cards.append(Card(rank: .Two, suit: .Spade))
		XCTAssertEqual(hand10.spadeScore(), 3)
		
		let hand11 = Hand()
		hand11.cards.append(Card(rank: .Ace, suit: .Spade))
		hand11.cards.append(Card(rank: .Eight, suit: .Spade))
		hand11.cards.append(Card(rank: .Five, suit: .Spade))
		hand11.cards.append(Card(rank: .Four, suit: .Spade))
		hand11.cards.append(Card(rank: .Three, suit: .Spade))
		XCTAssertEqual(hand11.spadeScore(), 3)
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
