//
//  Constants.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct Constants {
    public static let StocksUrl = "https://api.iextrading.com/1.0/stock/market/collection/tag?collectionName=Computer%20Hardware"
    public static let StockCellId = "stockCell"
    public static let MainStoryBoardId = "Main"
    public static let DetailId = "stockDetail"
    //detail labels
    public static let DCompany = "Company"
    public static let DSymbol = "Symbol"
    public static let DPrice = "Latest Price"
    public static let DExchange = "Primary Exchange"
    public static let DSector = "Sector"
    public static let DYTDChange = "YTD Change"
}
