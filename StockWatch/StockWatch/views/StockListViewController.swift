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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLoader.loadStocks() { [unowned self] stocks in
            
            self.stockList = stocks.shuffled()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            //print("stock load ", self.stockList)
        }
    }
}

extension StockListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let errorCell: UITableViewCell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stockCellId, for: indexPath) as? StockListTableViewCell else {
            return errorCell
        }
        guard let symbol = stockList[indexPath.row].symbol else {
            return errorCell
        }
        guard let price = stockList[indexPath.row].latestPrice else {
            return errorCell
        }
        
        cell.symbolLabel?.text = symbol
        cell.priceLabel?.text = String(price)
        
        return cell
    }
}
/*
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MovieCell
    let movie = movies[indexPath.row]
    let viewModel = MovieViewModel(model: movie)
    cell.setUpWith(viewModel)
    return cell
}
 */
