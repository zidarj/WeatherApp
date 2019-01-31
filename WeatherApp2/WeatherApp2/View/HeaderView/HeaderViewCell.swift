//
//  HeaderViewCell.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
// http://api.openweathermap.org/data/2.5/forecast?q=Osijek,HR&appid=2287f2b009b077c0b3d90a9a2b566a21

import UIKit

class HeaderViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityNameLabe: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var bgImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width/2)
    }
    
    func config(json: WeatherModel) {
        currentTempLabel.text = "\(Int(json.main.temp - 273.14))°C"
        cityNameLabe.text = json.name
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
