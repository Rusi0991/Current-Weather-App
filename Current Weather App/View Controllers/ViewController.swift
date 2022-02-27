//
//  ViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/24/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var hamburgerView: UIView!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hamburgerView.isHidden = true
    }

    @IBAction func seacrhButtonTapped(_ sender: Any) {
        self.presentSearchAlertController(title: "Enter city name", message: nil, style: .alert)
    }
    
    @IBAction func menuTapped(_ sender: Any) {
    }
}

