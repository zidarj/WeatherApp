//
//  HeaderViewCell.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
// http://api.openweathermap.org/data/2.5/forecast?q=Osijek,HR&appid=2287f2b009b077c0b3d90a9a2b566a21

import UIKit

class HeaderViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    func config(json: WeatherModel) {
        tempLabel.text = String(Int(json.main.temp - 273.14))
        cityLabel.text = json.name
        weatherImage.image = UIImage(named: (json.weather.first?.icon)!)
    }
    /*
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
