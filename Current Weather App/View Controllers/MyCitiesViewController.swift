//
//  MyCitiesViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/25/22.
//

import UIKit

class MyCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
var networkWeatherClient = NetworkWeatherClient()
    @IBOutlet weak var MyCitiesTableView: UITableView!
    @IBOutlet weak var backButton: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyCitiesTableView.delegate = self
        MyCitiesTableView.dataSource = self
//        MyCitiesTableView.register(MyCitiesCell.self, forCellReuseIdentifier: "MyCitiesCell")
    }
    
    @IBAction func addCityClicked(_ sender: Any) {
        self.presentAddAlertController(title: "Enter city name", message: nil, style: .alert){ [unowned self] city in
            self.networkWeatherClient.fetchCurrentWeather(forRequestType: .cityName(city: city))
            print(city)

        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell
        
//        Configure cell
        cell.iconImageView.image = UIImage(named: "Image")
        cell.temperatureLabel.text = "68 ºF"
        cell.cityLabel.text = "San Francisco"
        return cell
    }

}
