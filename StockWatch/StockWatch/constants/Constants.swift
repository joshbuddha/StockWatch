//
//  Constants.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct Constants {
    public static let stocksUrl = "https://api.iextrading.com/1.0/stock/market/collection/tag?collectionName=Computer%20Hardware"
    public static let stockCellId = "stockCell"
    public static let mainStoryBoardId = "Main"
    public static let detailId = "stockDetail"

    struct Details {
        //stock detail labels
        public static let company = "Company"
        public static let symbol = "Symbol"
        public static let price = "Latest Price"
        public static let exchange = "Primary Exchange"
        public static let sector = "Sector"
        public static let ytdChange = "YTD Change"
    }
}
