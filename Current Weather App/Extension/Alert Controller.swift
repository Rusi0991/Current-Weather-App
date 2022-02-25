//
//  Alert Controller.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/24/22.
//

import UIKit
extension ViewController{
    func presentSearchAlertController(title : String?, message : String?, style: UIAlertController.Style){
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Istambul", "Baku", "Barcelona", "Tokyo"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                print("search info for the \(cityName)")
        }
    }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
}
}
