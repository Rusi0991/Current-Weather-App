//
//  HamburgerViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/26/22.
//

import UIKit

class HamburgerViewController: UIViewController {
    @IBOutlet var mainBackgroundView: UIView!
    
    @IBOutlet weak var logoPicImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        hamburgerUI()
    }
    
    func hamburgerUI(){
        mainBackgroundView.layer.cornerRadius = 30
        mainBackgroundView.clipsToBounds = true
        logoPicImage.layer.cornerRadius = 40
        logoPicImage.clipsToBounds = true
    }
    
}
