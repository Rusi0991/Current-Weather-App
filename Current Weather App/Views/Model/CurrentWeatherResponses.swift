//
//  CurrentWeatherResponses.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 3/1/22.
//

import Foundation

struct CurrentWeatherResponses {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main {
    let temp : Double
    let feelsLike : Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        
    }
}
struct Weather {
    let id : Int
}
