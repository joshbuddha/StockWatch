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
    
    private(set) var stocks: [Stock] = []
    
    func loadStocks(urlString: String, completion: @escaping StocksCompletion) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
 
            do {
                
                let decoder = JSONDecoder()
                self.stocks = try decoder.decode([Stock].self, from: dataResponse)
                
                completion(self.stocks)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        task.resume()
        
    }
}
