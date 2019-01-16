//
//  WeatherModel.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import Foundation
import SwiftyJSON
struct WeatherModel {
    let coord: Coord
    let weather: [Weather]
    let base : String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let id: Int
    let name: String
    let cod: Int
    init(WithJson json: JSON) {
        coord = Coord(WithJson: json["coord"])
        base = json["base"].stringValue
        weather = json["weather"].arrayValue.map({ (j) -> Weather in
            let p = Weather(with: j)
            return p
        })
        main = Main(withJson: json["main"])
        visibility = json["visibility"].intValue
        wind = Wind(withJson: json["wind"])
        clouds = Clouds(withJson: json["clouds"])
        dt = json["dt"].intValue
        sys = Sys(withJson: json["sys"])
        id = json["id"].intValue
        name = json["name"].stringValue
        cod = json["cod"].intValue
    }
}

struct Coord {
    let lon: Double
    let lat: Double
    init(WithJson json: JSON) {
        lon = json["lon"].doubleValue
        lat = json["lat"].doubleValue
    }
}

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
    init(with json: JSON) {
        id = json["id"].intValue
        main = json["main"].stringValue
        description = json["description"].stringValue
        icon = json["icon"].stringValue
    }
}

struct Main {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
    init(withJson json: JSON) {
        temp = json["temp"].doubleValue
        pressure = json["pressure"].intValue
        humidity = json["humidity"].intValue
        temp_min = json["temp_min"].doubleValue
        temp_max = json["temp_max"].doubleValue
    }
}
struct Wind {
    let speed: Double
    let deg: Int
    init(withJson json: JSON) {
        speed = json["speed"].doubleValue
        deg = json["deg"].intValue
    }
}
struct Clouds {
    let all : Int
    init(withJson json:JSON) {
        all = json["all"].intValue
    }
    
}
struct Sys {
    let type: Int
    let id: Int
    let message: Double
    let country : String
    let sunrise: Double
    let sunset: Double
    init(withJson json: JSON) {
        type = json["type"].intValue
        id = json["id"].intValue
        message = json["message"].doubleValue
        country = json["country"].stringValue
        sunset = json["sunset"].doubleValue
        sunrise = json["sunrise"].doubleValue
    }
}
