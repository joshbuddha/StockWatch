//
//  Stock.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String?
    let latestPrice: Float?
    let companyName: String?
    let primaryExchange: String?
    let sector: String?
    let ytdChange: Float?
    
}

