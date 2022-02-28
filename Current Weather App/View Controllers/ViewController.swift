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
    
    @IBOutlet weak var hamburgerViewLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hamburgerViewTrailingC: NSLayoutConstraint!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hamburgerView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hamburgerView.isHidden = true
    }

    @IBAction func menuButtonClicked(_ sender: Any) {
        hamburgerView.isHidden = false
        if menuOut == false{
//            hamburgerViewLeadingC.constant = 0
//            hamburgerViewTrailingC.constant = 0
            menuOut = true
        } else {
//            hamburgerViewLeadingC.constant = 0
//            hamburgerViewTrailingC.constant = 0
            menuOut = false
            hamburgerView.isHidden = true
        }
        
        
    }
    @IBAction func seacrhButtonTapped(_ sender: Any) {
        self.presentSearchAlertController(title: "Enter city name", message: nil, style: .alert)
    }
    
   
    
}
