//
//  Alert Controller.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/24/22.
//

import UIKit
extension ViewController{
    
    
    func presentSearchAlertController(title : String?, message : String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void){
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Istambul", "Baku", "Barcelona", "Tokyo"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
//                self.networkWeatherClient.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
        }
    }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
}
}
extension MyCitiesViewController{
    func presentAddAlertController(title : String?, message : String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void){
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Istambul", "Baku", "Barcelona", "Tokyo"]
            tf.placeholder = cities.randomElement()
        }
        let save = UIAlertAction(title: "Add City", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
//                self.networkWeatherClient.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
                
                
//                let currentWeather : CurrentWeather!
//                if case let city == currentWeather.cityName {
//                    self.addCity(currentWeather: currentWeather)
//                }
//               
               
        }
    }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addAction(save)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
}
}
