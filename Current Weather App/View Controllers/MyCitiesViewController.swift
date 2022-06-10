//
//  MyCitiesViewController.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 2/25/22.
//

import UIKit
import GooglePlaces
import CoreData

class MyCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    var weatherLocation : WeatherLocation!
    var weatherLocations : [WeatherLocation] = []
    var dataController : DataController!
    var networkWeatherClient = NetworkWeatherClient()
    var cellObjects = MyCitiesCell()
    var myCities : MyCities!
    var fetchedResultsController : NSFetchedResultsController<MyCities>!
    
    
    @IBOutlet weak var myCitiesTableView: UITableView!
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addCityBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCitiesTableView.delegate = self
        myCitiesTableView.dataSource = self


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myCitiesTableView.reloadData()
//        setUpFetchResultController()
//        self.networkWeatherClient.onCompletion = {[weak self]currentWeather in
//            print(currentWeather.cityName)
//            guard let self = self else {return}
//
//
//        }
    }
    @IBAction func addCityPressed(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
           autocompleteController.delegate = self



           // Display the autocomplete view controller.
           present(autocompleteController, animated: true, completion: nil)
        self.networkWeatherClient.onCompletion = {[weak self]currentWeather in
            print(currentWeather.cityName)
            guard let self = self else {return}
            
        
        }
        
    }
    
//    @IBAction func addCityPressed1(_ sender: UIBarButtonItem) {

////        self.presentAddAlertController(title: "Enter city name", message: nil, style: .alert){ [unowned self] city in
////            self.networkWeatherClient.fetchCurrentWeather(forRequestType: .cityName(city: city))

////            print(city)
////
////        }
//    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if myCitiesTableView.isEditing{
            myCitiesTableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addCityBarButton.isEnabled = true
        } else {
            myCitiesTableView.setEditing(true, animated: true)
            sender.title = "Done"
            addCityBarButton.isEnabled = false
        }
    }
    
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return fetchedResultsController.sections?.count ?? 1
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        setUpFetchResultController()
//        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
        return weatherLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell
        cell.textLabel?.text = weatherLocations[indexPath.row].name
        cell.detailTextLabel?.text = "lat :\(weatherLocations[indexPath.row].latitude), long :\(weatherLocations[indexPath.row].longitude)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            weatherLocations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = weatherLocations[sourceIndexPath.row]
        weatherLocations.remove(at: sourceIndexPath.row)
        weatherLocations.insert(itemToMove, at: destinationIndexPath.row)
    }

    
//    func setUpFetchResultController(){
//        let fetchRequest : NSFetchRequest<MyCities> = MyCities.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//        fetchedResultsController.delegate = self
//
//        do {
//            try fetchedResultsController.performFetch()
//        } catch  {
//            fatalError("The fetch could not be performed\(error.localizedDescription)")
//        }
//
//    }

    
    func weatherLocation(at indexPath: IndexPath) -> WeatherLocation {
        return weatherLocations[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LocationDetailViewController{
            if let indexPath = myCitiesTableView.indexPathForSelectedRow{
                vc.weatherLocation = weatherLocation(at: indexPath)
                
               
            }
        }
    }
}

