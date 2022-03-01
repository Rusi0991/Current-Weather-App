//
//  NetworkWeatherClient.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/28/22.
//

import Foundation

struct NetworkWeatherClient {
    func fetchCurrentWeather() {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=9c4fce4dfea0e61951a0e8cb2039ffea"
    
    let url = URL(string: urlString)
    let session = URLSession(configuration: .default)
    let task =  session.dataTask(with: url!) { data, response, error in
        if let data = data {
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
        }
    }
    task.resume()
}
}
