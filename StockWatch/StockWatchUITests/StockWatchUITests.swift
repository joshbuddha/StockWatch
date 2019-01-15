//
//  StockWatchUITests.swift
//  StockWatchUITests
//
//  Created by Josh Kneedler on 1/14/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import XCTest

class StockWatchUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSelectStockAndHitBackButton() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["UAVS"]/*[[".cells.staticTexts[\"UAVS\"]",".staticTexts[\"UAVS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Back"].tap()
        
    }
    
    func testAppLabel() {
        let table = app.tables
        XCTAssertNotEqual(table.cells.count, 0, "table in UI test has data")
    }

}
