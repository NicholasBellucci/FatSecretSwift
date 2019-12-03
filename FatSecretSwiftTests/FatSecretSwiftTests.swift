//
//  FatSecretSwiftTests.swift
//  FatSecretSwiftTests
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import XCTest
@testable import FatSecretSwift

class FatSecretSwiftTests: XCTestCase {
    override func setUp() {
        enum Constants {
            static let apiKey = "Insert API Key Here"
            static let apiSecret = "Insert API Secret Here"
        }

        FatSecretCredentials.setConsumerKey(Constants.apiKey)
        FatSecretCredentials.setSharedSecret(Constants.apiSecret)
    }

    func testSearch() {
        let expectation = XCTestExpectation(description: "Search call")
        let fatSecretClient = FatSecretClient()
        
        fatSecretClient.searchFood(name: "coco-cola classic (12 oz)") { search in
            XCTAssertNotNil(search)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
}
