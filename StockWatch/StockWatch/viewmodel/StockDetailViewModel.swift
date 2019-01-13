//
//  StockDetailViewModel.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/13/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct StockDetailViewModel {
    
    let company: String?
    let symbol: String?
    let price: String?
    let exchange: String?
    let sector: String?
    let ytd: String?
    
    init(model: Stock) {
        self.company = model.companyName
        self.symbol = model.symbol
        self.price = model.latestPrice?.description
        self.exchange = model.primaryExchange
        self.sector = model.sector
        self.ytd = model.ytdChange?.description
    }
}

