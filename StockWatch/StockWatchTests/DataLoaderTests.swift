//
//  DataLoaderTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

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
        
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should have 0 elements to start.")
    }
    
    func testHandlingBadJSON() {

        let promise = expectation(description: "Expect Data Loader to handle error without crashing with bad URL string.")
        promise.isInverted = true
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "badJSON", withExtension: "json") else {
            XCTFail("local invalid json url failed")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 0, "Data load failed. Stocks count should be 0.")

    }
    
    func testLoadLocalJSON() {
        
        let promise = expectation(description: "Local valid json should load successfully.")
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validDataTest", withExtension: "json") else {
            XCTFail("local valid json url failed")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }

        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 2, "Stocks array has 2 valid elements")
        XCTAssertEqual(dataLoader.stocks[0].symbol, "UAVS", "First stock symbol in array is UAVS")
        
    }
    
    func testLoadLocalJSONWithNoSymbolValue() {
        
        let promise = expectation(description: "Local json is invalid with missing values.")
        promise.isInverted = true
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "invalidDataWithMissingValues", withExtension: "json") else {
            XCTFail("local valid json url failed with missing values")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should be 0 after loading invalid json.")
        
    }
    
    func testLoadLocalJSONWithNoSymbolEntity() {
        
        let promise = expectation(description: "Local json is valid with missing symbol entity.")
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validMissingEntity", withExtension: "json") else {
            XCTFail("local valid json url failed with missing symbol entity")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 2, "Stocks array has 2 valid elements")
        XCTAssertEqual(dataLoader.stocks[0].symbol, nil, "First stock symbol is not present")
        
    }
    
    func testLoadLocalJSONWithPriceAsString() {
        
        let promise = expectation(description: "Local price value is invalid if set as string.")
        promise.isInverted = true
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "invalidPriceAsString", withExtension: "json") else {
            XCTFail("local invalid json url failed with type mismatch")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should be 0 after loading invalid json.")
        
    }
}
