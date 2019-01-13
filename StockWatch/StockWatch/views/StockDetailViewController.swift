//
//  StockDetailViewController.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    
    var stockDetails: Stock?
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

        companyLabel.text = Constants.DCompany + ": \(stockDetails?.companyName ?? "")"
        symbolLabel.text = Constants.DSymbol + ": \(stockDetails?.symbol ?? "")"
        latestPriceLabel.text = Constants.DPrice + ": \(stockDetails?.latestPrice?.description ?? "")"
        exchangeLabel.text = Constants.DExchange + ": \(stockDetails?.primaryExchange ?? "")"
        sectorLabel.text = Constants.DSector + ": \(stockDetails?.sector ?? "")"
        ytdLabel.text = Constants.DYTDChange + ": \(stockDetails?.ytdChange?.description ?? "")"
    }
    
}
