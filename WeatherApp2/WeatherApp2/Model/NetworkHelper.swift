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
    static func fetchDataDay(url: URLConvertible, completion: @escaping ([List]) -> Void) {
        Alamofire.request(url).responseJSON { (response) in
            if let val = response.result.value {
                let json = JSON(val)
                let data: [List] = json["list"].arrayValue.map({ (j) -> List in
                    let p = List(withJSON: j)
                    return p
                })
                completion(data)
            }
        }
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
