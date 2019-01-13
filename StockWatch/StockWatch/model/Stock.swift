//
//  Stock.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    
    var symbol: String?
    var latestPrice: Float?
    var companyName: String?
    var primaryExchange: String?
    var sector: String?
    var ytdChange: Float?
    
}

