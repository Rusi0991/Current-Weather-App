//
//  LocationDetailViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 4/26/22.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var weatherLocation : WeatherLocation!
    var weatherLocations : [WeatherLocation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if weatherLocation == nil{
            weatherLocation = WeatherLocation(name: "Current Loaction", latitude: 0.0, longitude: 0.0)
            weatherLocations.append(weatherLocation)
        }
        updateInterfaceWith()
    }
    func updateInterfaceWith(){
        
        self.cityLabel.text = "New York"
        self.temperatureLabel.text = "66ºF"
        self.feelsLikeTemperatureLabel.text = "64ºF"
    }

}
