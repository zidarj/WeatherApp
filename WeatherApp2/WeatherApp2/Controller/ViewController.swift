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
import CoreLocation
class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var currentWeather: WeatherModel?
    var dayWeather = [List]()
    private let locationManager = CLLocationManager()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerHeaderFooterNib(HeaderViewCell.self)
        self.tableView.refreshControl = refreshControl
    }
    @objc private func refreshWeatherData(_ sender: Any) {
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
    }
    func updateHeaderView() {
        print("Test")
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
                c.backgroundColor = UIColor(hexString: "#00ADD7")
            }else {
                c.backgroundColor = UIColor(hexString: "#00ADD7")
            }
            c.config(with: dayWeather[indexPath.row])
            c.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.4) {
                c.transform = CGAffineTransform.identity
            }
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
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        NetworkHelper.fetchData(lon: locValue.longitude, lat: locValue.latitude) { (response) in
            self.currentWeather = response
            
        }
        NetworkHelper.fetchDataDay(lon: locValue.longitude, lat: locValue.latitude) { (response) in
            self.dayWeather = response
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}
