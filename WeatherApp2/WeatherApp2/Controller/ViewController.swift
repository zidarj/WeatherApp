//
//  ViewController.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    var currentWeather: WeatherModel?
    var dayWeather = [List]()
    var allList = [List]()
    let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Osijek,HR&appid=2287f2b009b077c0b3d90a9a2b566a21")!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerHeaderFooterNib(HeaderViewCell.self)
        NetworkHelper.fetchDataDay(url: url) { (data) in
            self.dayWeather = data
            self.tableView.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayWeather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherCell = tableView.dequeueReusableCell()
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let c = cell as? WeatherCell {
            if indexPath.row % 8 == 0 {
                c.backgroundColor = UIColor.red
            }else {
                c.backgroundColor = UIColor.blue
            }
             c.config(with: dayWeather[indexPath.row])
            print(indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: HeaderViewCell = tableView.dequeueReusableHeaderFooterView()
        header.config(json: currentWeather!)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
}
