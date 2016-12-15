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

	func testBid() {
		let hand = Hand()
		let bid = hand.bid()
		XCTAssertEqual(bid, 0)
	}

}
