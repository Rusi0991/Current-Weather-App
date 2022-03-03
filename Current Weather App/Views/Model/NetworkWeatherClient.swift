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
            let currentWeather = self.parseJSON(withData : data)
            
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
            print(currentWeatherData.main.temp)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
}
}
