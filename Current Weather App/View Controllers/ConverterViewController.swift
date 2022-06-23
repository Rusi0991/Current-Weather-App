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

    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        let fahrenheitTemperature = Int(round((sender.value * 9/5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
    }
}
