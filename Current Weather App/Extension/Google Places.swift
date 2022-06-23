//
//  Google Places.swift
//  Current Weather App
//
//  Created by Ruslan Ismayilov on 4/25/22.
//

import Foundation
import GooglePlaces
extension MyCitiesViewController : GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
//      let newLocation = WeatherLocation(name: place.name ?? "unknown place", latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
      let myCities = MyCities(context: appDelegate.dataController.viewContext)
      myCities.cityName = place.name ?? "unknown place"
      myCities.longitude = place.coordinate.longitude
      myCities.latitude = place.coordinate.latitude
      myCities.creationDate = Date()
          
      do{
          try dataController?.viewContext.save()
      }catch{
          fatalError("Unable to  save data\(error.localizedDescription)")
      }
      
      
    dismiss(animated: true, completion: nil)
      myCitiesTableView.reloadData()
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }


}
