//
//  StockListTableViewCell.swift
//  StockWatch
//
//  Created by Josh Kneedler on 1/12/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import UIKit

class StockListTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ data: Stock) {
        
        guard let symbol = data.symbol else { return }
        guard let price = data.latestPrice else { return }
        
        symbolLabel?.text = symbol
        priceLabel?.text = String(price)
        
    }

}
