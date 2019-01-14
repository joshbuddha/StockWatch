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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let onlineUrl = URL(string: Constants.stocksUrl) else { return }
        
        dataLoader.loadStocks(url: onlineUrl) { [unowned self] stocks in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    func presentStockDetailView(with stock: Stock) {
        guard let detailController = UIStoryboard(name: Constants.mainStoryBoardId,
                                               bundle: nil).instantiateViewController(withIdentifier: Constants.detailId) as? StockDetailViewController else {
                                                return
        }

        let detailViewModel = StockDetailViewModel(model: stock)
        detailController.stockDetailViewModel = detailViewModel
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension StockListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataLoader.stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stockCellId, for: indexPath)
        guard let stockCell = cell as? StockListTableViewCell else { return cell }
        stockCell.setupCell(with: dataLoader.stocks[indexPath.row])
        
        return stockCell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        presentStockDetailView(with: dataLoader.stocks[indexPath.row])

    }
}


