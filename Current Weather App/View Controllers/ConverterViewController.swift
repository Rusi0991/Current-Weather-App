//
//  ConverterViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/25/22.
//

import UIKit

class ConverterViewController: UIViewController {
    
//    Oulets
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider!{
       
    didSet{
        
        slider.maximumValue = 100
        slider.minimumValue = -100
        slider.value = 0
        
    }
    }
//    Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieve the slider location
        slider.value = UserDefaults.standard.float(forKey: "Slider value key")
        
        celsiusLabel.text = UserDefaults.standard.string(forKey: "Celsius Value Changed")
        fahrenheitLabel.text = UserDefaults.standard.string(forKey:  "Fahrenheit Value Changed")
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        var temperatureCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        var fahrenheitTemperature = Int(round((sender.value * 9/5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
        // Save the slider location
            UserDefaults.standard.set(slider.value, forKey: "Slider value key")
        UserDefaults.standard.set("\(temperatureCelsius)ºC", forKey: "Celsius Value Changed")
        UserDefaults.standard.set("\(fahrenheitTemperature)ºF", forKey: "Fahrenheit Value Changed")
        
      
      
        
    }
}
