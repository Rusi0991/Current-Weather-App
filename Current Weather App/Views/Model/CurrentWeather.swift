//
//  CurrentWeather.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 3/1/22.
//

import Foundation
struct CurrentWeather{
    let cityName : String
    let temperature : Double
//    because label has string in it
    var temperatureString : String{
        return "\(temperature.rounded())"
    }
    let feelsLikeTemperature : Double
    var feelsLikeTemperatureString : String{
        return"\(feelsLikeTemperature)"
    }
    let conditionCode : Int
    
    init?(currentWeatherResponses : CurrentWeatherResponses){
        cityName = currentWeatherResponses.name
        temperature = currentWeatherResponses.main.temp
        feelsLikeTemperature = currentWeatherResponses.main.feelsLike
        conditionCode = currentWeatherResponses.weather.first!.id
    }
}
