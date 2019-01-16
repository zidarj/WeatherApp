//
//  DayMode.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 16/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import Foundation
import SwiftyJSON
struct DayModel {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
    let city: City
    init(withJSON json: JSON) {
        cod = json["cod"].stringValue
        message = json["message"].doubleValue
        cnt = json["cnt"].intValue
        list = json["list"].arrayValue.map({ (j) -> List in
            let p = List(withJSON: j)
            return p
        })
        city = City(withJSON: json["city"])
    }
}
struct List {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds:Clouds
    let sys: Sys
    let dt_text: String
    let wind: Wind
    init(withJSON json: JSON) {
        dt = json["dt"].intValue
        main = Main(withJson: json["main"])
        weather = json["weather"].arrayValue.map({ (j) -> Weather in
            let p = Weather(with: j)
            return p
        })
        clouds = Clouds(withJson: json["clouds"])
        sys = Sys(withJson: json["sys"])
        dt_text = json["dt_txt"].stringValue
        wind = Wind(withJson: json["wind"])
    }
}
struct City {
    let id: Int
    let name: String
    let country: String
    let population: Int
    init(withJSON json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        country = json["country"].stringValue
        population = json["population"].intValue
    }
}
