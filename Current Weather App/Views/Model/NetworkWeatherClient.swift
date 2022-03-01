//
//  NetworkWeatherClient.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/28/22.
//

import Foundation

struct NetworkWeatherClient {
    func fetchCurrentWeather(forCity city : String) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
    
        guard let url = URL(string: urlString) else {return}
    let session = URLSession(configuration: .default)
    let task =  session.dataTask(with: url) { data, response, error in
        if let data = data {
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
        }
    }
    task.resume()
}
}
