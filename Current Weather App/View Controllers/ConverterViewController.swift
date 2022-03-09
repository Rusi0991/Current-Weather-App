//
//  ConverterViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/25/22.
//

import UIKit

class ConverterViewController: UIViewController {
    
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var fahrenheitLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
    }
}
