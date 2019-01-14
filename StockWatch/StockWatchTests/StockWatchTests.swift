//
//  StockWatchTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/13/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import XCTest
@testable import StockWatch

class StockWatchTests: XCTestCase {
    
    let dataLoader = DataLoader()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
    }
    
    /*
    func testStocksArrayCannotBeSetExternally() {
        let dataLoader = DataLoader()
        
        let stockA = Stock(symbol: "rty", latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        let stockB = Stock(symbol: "rtyz", latestPrice: 3.33, companyName: "sears", primaryExchange: "global", sector: "zoo", ytdChange: 3.4)
        var tempArray: [Stock] = [stockA, stockB]
        
        dataLoader.stocks = tempArray
        
    }
 */

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
