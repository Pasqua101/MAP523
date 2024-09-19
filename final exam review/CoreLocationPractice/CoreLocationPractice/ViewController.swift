//
//  ViewController.swift
//  CoreLocationPractice
//
//  Created by user256704 on 4/16/24.
//

import UIKit

// MARK: 1. import the CoreLocation Library
// - has methods and properties that allow you to manage addresses and coordinates
import CoreLocation
class ViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var streetTF: UITextField!
  @IBOutlet weak var cityTF: UITextField!
  @IBOutlet weak var countryTF: UITextField!
  @IBOutlet weak var coordinatesLabel: UILabel!
  
  // MARK: 2. Geocoder object
  let geocoder = CLGeocoder()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func fetchCoordinates(_ sender: Any) {
    guard let street = streetTF.text,
          let city = cityTF.text,
          let country = countryTF.text
    else {return}
    
    print("\(country), \(city), \(street)")
    
    getLocation(address: "\(country), \(city), \(street)")
  }
  
  // helper function
  func getLocation(address: String) {
    // MARK: 3. Forward geocoding request
    // - Taking a human readable addresss and converting it to a coordinate
      geocoder.geocodeAddressString(address) { results, error in
          print("Sent request to geocoding service, waiting for response")
          
          // unsuccessful
              if (error != nil) {
                print("Error occured during geocoding request:")
                print(error ?? "")
                self.coordinatesLabel.text = "An error occured, try again later."
                return
              } else {
                  // able to find a coordinate
                  print("Coordinate found")
                  let placemark: CLPlacemark = (results?.first)!
                  print(placemark)
                  
                  // extract the relevant data (lat, long)
                  if let lat = placemark.location?.coordinate.latitude,
                     let long = placemark.location?.coordinate.longitude {
                    print("Coordinate: \(lat), \(long)")
                    self.coordinatesLabel.text = "\(lat), \(long)"
                  } else {
                    print("Could not extract coordinates")
                    self.coordinatesLabel.text = "Could not extract coordinates"
                  }
                }
          
        }
  }
  
}

