//
//  DataLoaderTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation
import XCTest
@testable import StockWatch

class DataLoaderTests: XCTestCase {
    
     let dataLoader = DataLoader()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialStocksArray() {
        
        
        XCTAssertEqual(dataLoader.stocks.count, 0, "stocks array should have 0 elements to start")
    }
    
    func testDataLoaderResult() {
        let promise = expectation(description: "Data Loader loaded")
        dataLoader.loadStocks(urlString: Constants.stocksUrl) { stocks in
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(dataLoader.stocks.count, 0, "stocks array should not be 0")
    }
}
