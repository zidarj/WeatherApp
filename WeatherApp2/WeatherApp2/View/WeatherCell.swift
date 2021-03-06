//
//  WeatherCell.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 16/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var DT: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(with json: List) {
        imgView.image = UIImage(named: (json.weather.first?.icon)!)
        maxTemp.text = "\(Int(json.main.temp_max - 273.14))°C maxTemp"
        minTemp.text = "\(Int(json.main.temp_min - 273.14))°C minTemp"
            let timeResult = json.dt
            let date = NSDate(timeIntervalSince1970: TimeInterval(timeResult))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        let localDate = dateFormatter.string(from: date as Date)
       DT.text = localDate
    }

}
