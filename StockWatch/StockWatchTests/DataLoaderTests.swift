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
    let allowOnlineTest = true

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialStocksArray() {
        
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should have 0 elements to start.")
    }
    
    func testOnlineDataLoaderResult() {
        if allowOnlineTest {
            let promise = expectation(description: "Online data loaded from URL.")
            guard let onlineUrl = URL(string: Constants.stocksUrl) else { return }
            dataLoader.loadStocks(url: onlineUrl) { stocks in
                promise.fulfill()
            }
            waitForExpectations(timeout: 2, handler: nil)
            XCTAssertNotEqual(dataLoader.stocks.count, 0, "Stocks array should not be 0.")
        }
    }
    
    func testHandlingWithBadURL() {
        if allowOnlineTest {
            let promise = expectation(description: "Expect Data Loader to handle error without crashing with bad URL string.")
            promise.isInverted = true
            guard let onlineUrl = URL(string: "https://api.iextrading.com/1.0") else { return }
            
            dataLoader.loadStocks(url: onlineUrl) { stocks in
                promise.fulfill()
            }
            
            waitForExpectations(timeout: 2, handler: nil)
            XCTAssertEqual(dataLoader.stocks.count, 0, "Data load failed. Stocks count should be 0.")
        }
    }
    
    func testLoadLocalJSON() {
        
        let promise = expectation(description: "Local valid json should load successfully.")
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validDataTest", withExtension: "json") else { return }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotEqual(dataLoader.stocks.count, 0, "Stocks array should not be 0 after loading local valid json.")
        
    }
    
    func testLoadLocalJSONWithNoSymbolValue() {
        
        let promise = expectation(description: "Local json is invalid with missing values.")
        promise.isInverted = true
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "invalidDataWithMissingValues", withExtension: "json") else { return }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should be 0 after loading invalid json.")
        
    }
    
    func testLoadLocalJSONWithNoSymbolEntity() {
        
        let promise = expectation(description: "Local json is valid with missing symbol entity.")
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validMissingEntity", withExtension: "json") else { return }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotEqual(dataLoader.stocks.count, 0, "Stocks array should not be 0 after loading local valid json.")
        
    }
    
    func testLoadLocalJSONWithPriceAsString() {
        
        let promise = expectation(description: "Local price value is invalid if set as string.")
        promise.isInverted = true
        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "invalidPriceAsString", withExtension: "json") else { return }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(dataLoader.stocks.count, 0, "Stocks array should be 0 after loading invalid json.")
        
    }
}
