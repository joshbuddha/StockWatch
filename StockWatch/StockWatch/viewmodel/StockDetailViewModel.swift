//
//  StockDetailViewModel.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/13/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct StockDetailViewModel {
    
    private let stock: Stock
    
    var company: String {
        guard let name = stock.companyName else { return "\(Constants.Details.company) Not Found." }
        return "\(Constants.Details.company): \(name)"
    }
    
    var symbol: String {
        guard let symbol = stock.symbol else { return "\(Constants.Details.symbol) Not Found." }
        return "\(Constants.Details.symbol): \(symbol)"
    }
    
    var price: String {
        guard let price = stock.latestPrice else { return "\(Constants.Details.price) Not Found." }
        return "\(Constants.Details.price): \(price)"
    }
    
    var exchange: String {
        guard let exchange = stock.primaryExchange else { return "\(Constants.Details.exchange) Not Found." }
        return "\(Constants.Details.exchange): \(exchange)"
    }
    
    var sector: String {
        guard let sector = stock.sector else { return "\(Constants.Details.sector) Not Found." }
        return "\(Constants.Details.sector): \(sector)"
    }
    
    var ytd: String {
        guard let ytd = stock.ytdChange else { return "\(Constants.Details.ytdChange) Not Found." }
        return "\(Constants.Details.ytdChange): \(ytd)"
    }
    
    init(model: Stock) {
        stock = model
    }
    
}




