//
//  NetworkWeatherClient.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/28/22.
//

import Foundation
import CoreLocation

class NetworkWeatherClient {
    
    var onCompletion : ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city : String){

    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=imperial"
    
        guard let url = URL(string: urlString) else {return}
    let session = URLSession(configuration: .default)
    let task =  session.dataTask(with: url) { data, response, error in
        if let data = data {

            if let currentWeather = self.parseJSON(withData : data){

                 self.onCompletion?(currentWeather)
                print("currentWeather: \(currentWeather)")
            }
        }
    }
    task.resume()
}
    func fetchCurrentWeatherLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees){

    let urlString = "https://api.openweathermap.org/geo/1.0/reverse?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
    
        guard let url = URL(string: urlString) else {return}
    let session = URLSession(configuration: .default)
    let task =  session.dataTask(with: url) { data, response, error in
        if let data = data {

            if let currentWeather = self.parseJSON(withData : data){

                 self.onCompletion?(currentWeather)
                print("currentWeather: \(currentWeather)")
            }
        }
    }
    task.resume()
}
    func parseJSON(withData data : Data) -> CurrentWeather?{
        let decoder = JSONDecoder()
        do{
           let currentWeatherData = try decoder.decode(CurrentWeatherResponses.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherResponses: currentWeatherData) else {
                return nil }
            return currentWeather
//            print(currentWeatherData.main.temp)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
}
}
