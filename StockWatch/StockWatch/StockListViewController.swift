//
//  StockListViewController.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import UIKit

class StockListViewController: UIViewController {
    
    let dataLoader = DataLoader()
    var stockList: [Stock] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        dataLoader.loadStocks() { [unowned self] stocks in
            self.stockList = stocks
            print("stock load ", self.stockList)
        }
    }
}
