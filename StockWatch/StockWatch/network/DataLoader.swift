//
//  DataLoader.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

typealias StocksCompletion = ([Stock])->()

class DataLoader {
    
    var stocks: [Stock] = []
    
    func loadStocks(completion: @escaping StocksCompletion) {
        
        stocks.removeAll(keepingCapacity: false)
        
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
                
                for stock in stockModel {
                    self.stocks.append(stock)
                }
                
                completion(self.stocks)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        task.resume()
        
    }
}
