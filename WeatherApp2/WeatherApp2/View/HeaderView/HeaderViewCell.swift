//
//  HeaderViewCell.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    func config(json: Double) {
        let test: Int = Int(json - 273.15)
        tempLabel.text = String(test)
        cityLabel.text = "Zagreb"
    }
    /*
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
