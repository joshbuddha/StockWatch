//
//  StockDetailViewController.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    
    var stockDetailViewModel: StockDetailViewModel?
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var latestPriceLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var sectorLabel: UILabel!
    @IBOutlet weak var ytdLabel: UILabel!
    
    @IBAction func backBtnHit(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        companyLabel.text = stockDetailViewModel?.company
        symbolLabel.text = stockDetailViewModel?.symbol
        latestPriceLabel.text = stockDetailViewModel?.price
        exchangeLabel.text = stockDetailViewModel?.exchange
        sectorLabel.text = stockDetailViewModel?.sector
        ytdLabel.text = stockDetailViewModel?.ytd
        
    }
    
}
