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

//        var weatherLocation = WeatherLocation(name: "Fremont , CA", latitude: 0, longitude: 0)
//        weatherLocations.append(weatherLocation)
//        weatherLocation = WeatherLocation(name: "Istanbul , Turkey", latitude: 0, longitude: 0)
//        weatherLocations.append(weatherLocation)
//        weatherLocation = WeatherLocation(name: "Paris , France", latitude: 0, longitude: 0)
//        weatherLocations.append(weatherLocation)
//        MyCitiesTableView.register(MyCitiesCell.self, forCellReuseIdentifier: "MyCitiesCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setUpFetchResultController()
        self.networkWeatherClient.onCompletion = {[weak self]currentWeather in
            print(currentWeather.cityName)
            guard let self = self else {return}
          
        
        }
    }
    @IBAction func addCityPressed(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
           autocompleteController.delegate = self



           // Display the autocomplete view controller.
           present(autocompleteController, animated: true, completion: nil)
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
    
    
    func addCity(currentWeather : CurrentWeather){
//        let city = MyCities(context: dataController.viewContext)
//        city.cityName = currentWeather.cityName
//        city.temperature = currentWeather.temperature
//        city.conditionCode = Int16(currentWeather.conditionCode)
//        do{
//           try dataController.viewContext.save()
//
//        }catch{
//            fatalError(error.localizedDescription)
//        }
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
//    func updateInterfaceWith(weather : CurrentWeather){
//        DispatchQueue.main.async {
//            self.cellObjects.iconImageView.image = UIImage(systemName: weather.systemIconNameString)
//            self.cellObjects.cityLabel.text = weather.cityName
//            self.cellObjects.temperatureLabel.text = weather.temperatureString
//
//            self.cellObjects.iconImageView.image = UIImage(systemName: weather.systemIconNameString)
//
//        }
//
//    }
    
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


}

