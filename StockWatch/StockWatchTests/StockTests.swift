//
//  StockTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import XCTest
@testable import StockWatch

class StockTests: XCTestCase {
    
    let dataLoader = DataLoader()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStockExists() {
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        
        XCTAssertNotNil(stockA, "Stock struct exists")
    }
    
    func testStockValues() {
        let promise = expectation(description: "Local valid json should load successfully for Stock model test")
        
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validDataTest", withExtension: "json") else {
            XCTFail("local valid url fail")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertEqual(dataLoader.stocks[0].symbol, "UAVS", "First stock symbol in array is UAVS")
        XCTAssertEqual(dataLoader.stocks[0].latestPrice, 0.502413, "Latest price is 0.502413")
        XCTAssertEqual(dataLoader.stocks[0].companyName, "AgEagle Aerial Systems Inc.", "Company name is AgEagle Aerial Systems Inc.")
        XCTAssertEqual(dataLoader.stocks[0].primaryExchange, "NYSE American", "Exchange is NYSE American")
        XCTAssertEqual(dataLoader.stocks[0].sector, "Technology", "Sector is Technology")
        XCTAssertEqual(dataLoader.stocks[0].ytdChange, -0.07962555555555562, "YTD is -0.07962555555555562")
        
    }
    
    func testStockStructPropertyTypes() {
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        
        XCTAssertTrue(stockA.symbol is String)
        XCTAssertTrue(stockA.latestPrice is Float)
        XCTAssertTrue(stockA.companyName is String)
        XCTAssertTrue(stockA.primaryExchange is String)
        XCTAssertTrue(stockA.sector is String)
        XCTAssertTrue(stockA.ytdChange is Float)
        
    }
    

    
    
    
}
