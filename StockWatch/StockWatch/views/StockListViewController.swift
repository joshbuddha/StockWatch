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
            
            self.stockList = stocks
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
    }
}

extension StockListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let errorCell: UITableViewCell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.StockCellId, for: indexPath) as? StockListTableViewCell else {
            return errorCell
        }
        
        cell.setupCell(stockList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailController = UIStoryboard(name: Constants.MainStoryBoardId,
                                               bundle: nil).instantiateViewController(withIdentifier: Constants.DetailId) as? StockDetailViewController {
            detailController.stockDetails = stockList[indexPath.row]
            if let navigator = navigationController {
                navigator.pushViewController(detailController, animated: true)
            }
        }
    }
}


