//
//  MyCitiesViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/25/22.
//

import UIKit

class MyCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var MyCitiesTableView: UITableView!
    @IBOutlet weak var backButton: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell
        cell.textLabel?.text = "Test"
        return cell
    }

}
