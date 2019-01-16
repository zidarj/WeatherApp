//
//  NetworkHelper.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 16/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class NetworkHelper  {
    private init () {}
    static func fetchData(url: URLConvertible, completion: @escaping (WeatherModel) -> Void) {
        Alamofire.request(url).responseJSON { (response) in
            if let val = response.result.value {
                let json = JSON(val)
                let data: WeatherModel = WeatherModel(WithJson: json)
                completion(data)
            }
        }
    }
    static func fetch(url: URLConvertible) -> String {
        Alamofire.request(url).responseJSON { (response) in
            print("TEST2")
        }
        return "Test2"
    }
}
