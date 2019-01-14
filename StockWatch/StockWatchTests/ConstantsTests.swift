//
//  ConstantsTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import XCTest
@testable import StockWatch

class ConstantsTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBaseConstantValues() {
        
        XCTAssertEqual(Constants.stocksUrl, "https://api.iextrading.com/1.0/stock/market/collection/tag?collectionName=Computer%20Hardware", "url valid")
        XCTAssertEqual(Constants.stockCellId, "stockCell", "cell id valid")
        XCTAssertEqual(Constants.mainStoryBoardId, "Main", "main storyboard id valid")
        XCTAssertEqual(Constants.detailId, "stockDetail", "details storyboard id valid")
        
    }
    
    func testStockDetailValues() {
        XCTAssertEqual(Constants.Details.company, "Company", "company label valid")
        XCTAssertEqual(Constants.Details.symbol, "Symbol", "symbol label valid")
        XCTAssertEqual(Constants.Details.price, "Latest Price", "latest price label valid")
        XCTAssertEqual(Constants.Details.exchange, "Primary Exchange", "primary exchange label valid")
        XCTAssertEqual(Constants.Details.sector, "Sector", "sector label valid")
        XCTAssertEqual(Constants.Details.ytdChange, "YTD Change", "ytd label valid")
    }
    
}
