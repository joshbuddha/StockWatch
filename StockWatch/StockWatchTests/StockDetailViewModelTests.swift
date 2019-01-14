//
//  StockDetailViewModelTests.swift
//  StockWatchTests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import XCTest
@testable import StockWatch

class StockDetailViewModelTests: XCTestCase {
    let dataLoader = DataLoader()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoadViewModelConfirmExists() {
        
        let promise = expectation(description: "Local valid json should load successfully for view model test.")

        guard let localUrl = Bundle(for: type(of: self)).url(forResource: "validDataTest", withExtension: "json") else {
            XCTFail("local valid url fail")
            return
        }
        
        dataLoader.loadStocks(url: localUrl) { stocks in
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        
        let testViewModel = StockDetailViewModel(model: dataLoader.stocks[0])
        XCTAssertNotNil(testViewModel, "Test view model exists")
        
    }
    
    func testConfirmOptionalSymbolValueInViewModel() {
        
        let stockA = Stock(symbol: nil, latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        let testViewModel = StockDetailViewModel(model: stockA)
        let symbolString = testViewModel.symbol
        XCTAssertEqual(symbolString, "Symbol Not Found.", "Confirm nil Stock symbol value will present not found string")
        
    }
    
    func testConfirmOptionalPriceValueInViewModel() {
        
        let stockA = Stock(symbol: "AAPL", latestPrice: nil, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        let testViewModel = StockDetailViewModel(model: stockA)
        let priceString = testViewModel.price
        XCTAssertEqual(priceString, "Latest Price Not Found.", "Confirm nil Stock price value will present not found string")
        
    }
    
    func testConfirmOptionalCompanyValueInViewModel() {
        
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: nil, primaryExchange: "street", sector: "biz", ytdChange: 999.0)
        let testViewModel = StockDetailViewModel(model: stockA)
        let companyString = testViewModel.company
        XCTAssertEqual(companyString, "Company Not Found.", "Confirm nil Stock company value will present not found string")
        
    }
    
    func testConfirmOptionalExchangeValueInViewModel() {
        
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: "safeway", primaryExchange: nil, sector: "biz", ytdChange: 999.0)
        let testViewModel = StockDetailViewModel(model: stockA)
        let exchangeString = testViewModel.exchange
        XCTAssertEqual(exchangeString, "Primary Exchange Not Found.", "Confirm nil Stock exchange value will present not found string")
        
    }
    
    func testConfirmOptionalSectorValueInViewModel() {
        
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: nil, ytdChange: 999.0)
        let testViewModel = StockDetailViewModel(model: stockA)
        let sectorString = testViewModel.sector
        XCTAssertEqual(sectorString, "Sector Not Found.", "Confirm nil Stock sector value will present not found string")
        
    }
    
    func testConfirmOptionalYTDValueInViewModel() {
        
        let stockA = Stock(symbol: "AAPL", latestPrice: 9.33, companyName: "safeway", primaryExchange: "street", sector: "biz", ytdChange: nil)
        let testViewModel = StockDetailViewModel(model: stockA)
        let ytdString = testViewModel.ytd
        XCTAssertEqual(ytdString, "YTD Change Not Found.", "Confirm nil Stock ytd value will present not found string")
        
    }
}
