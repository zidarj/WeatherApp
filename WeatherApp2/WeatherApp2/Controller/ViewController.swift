//
//  ViewController.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    var currentWeather: WeatherModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerHeaderFooterNib(HeaderViewCell.self)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.red
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: HeaderViewCell = tableView.dequeueReusableHeaderFooterView()
        header.config(json: (currentWeather?.main.temp)!)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
}
