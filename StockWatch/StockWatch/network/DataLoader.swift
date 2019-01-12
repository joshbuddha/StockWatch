//
//  DataLoader.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

struct DataLoader {
    
    mutating func loadStocks() {
        guard let url = URL(string: Constants.StocksUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let stockModel = try decoder.decode([Stock].self, from: dataResponse)
                print("stock Model ", stockModel)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
