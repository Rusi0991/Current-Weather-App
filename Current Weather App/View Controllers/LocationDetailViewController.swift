//
//  LocationDetailViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 4/26/22.
//

import UIKit
import CoreData

class LocationDetailViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    var networkWeatherClient = NetworkWeatherClient()
    var dataController : DataController!
    
    var myCities: MyCities!
    var fetchedResultsController : NSFetchedResultsController<MyCities>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let city = myCities.cityName?.split(separator: " ").joined(separator: "%20")
        self.networkWeatherClient.fetchCurrentWeather(forRequestType: .cityName(city: city!))

        self.networkWeatherClient.onCompletion = {[weak self]currentWeather in
            print(currentWeather.cityName)
            guard let self = self else {return}
            self.updateInterfaceWith(weather: currentWeather)

        }
//        if weatherLocation == nil{
//            weatherLocation = WeatherLocation(name: "Current Location", latitude: 0.0, longitude: 0.0)
//            weatherLocations.append(weatherLocation)
//        }
        
        
    }
    
    func updateInterfaceWith(weather : CurrentWeather){
        DispatchQueue.main.async {
            
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
            
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as! MyCitiesViewController
//        destination.weatherLocations = weatherLocations
//    }
//
//  @IBAction func unwindSegueFromLocationListVC(segue : UIStoryboardSegue){
//      let source = segue.source as! MyCitiesViewController
//      weatherLocations = source.weatherLocations
//      weatherLocation = weatherLocations[source.selectedLocationIndex]
//      updateInterfaceWith()
//    }

}
