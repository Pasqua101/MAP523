//
//  ReverseGeoCodeVC.swift
//  CoreLocationPractice
//
//  Created by user256704 on 4/16/24.
//

import UIKit

// MARK: 1. import CoreLocation
import CoreLocation

class ReverseGeoCodeVC: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var latitudeTF: UITextField!
  @IBOutlet weak var longitudeTF: UITextField!
  @IBOutlet weak var addressLabel: UILabel!
  
  // MARK: 2. Geocoder object
  let geocoder = CLGeocoder()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func fetchAddress(_ sender: Any) {
    guard let lat = latitudeTF.text,
          let long = longitudeTF.text
    else {return}
    
    print("Got coordinates: (\(lat), \(long))")
    
    getAddress(latitude:lat, longitude: long)
  }
  
  // helper function
  func getAddress(latitude:String, longitude:String) {
    // MARK: 3. Reverse geocoding request
    // - Taking a coordinate and converting it to a human readable addresss
    guard let latDouble = Double(latitude),
          let longDouble = Double(longitude)
    else {return}
    
    let location = CLLocation(latitude: latDouble, longitude: longDouble)
    
    geocoder.reverseGeocodeLocation(location) { results, error in
      print("Sent request to geocoding service, waiting for response")
      
      if let err = error {
        print("Error occured during geocoding request: \(err)")
        self.addressLabel.text = "An error occured, try again later."
      }
      
      if let res = results {
        if (res.count == 0) {
          // not able to find a coordinate
          print("No addresses found for this coordinate")
        } else {
          // able to find a coordinate
          print("Address found")
          let placemark:CLPlacemark = res.first!
          print("Placemark: \(placemark)")
          
          //compose an actual address
          let name = placemark.name ?? ""
          let street = "\(placemark.subThoroughfare ?? "") \(placemark.thoroughfare ?? "")"
          let city = placemark.locality ?? ""
          let province = placemark.administrativeArea ?? ""
          let country = placemark.country ?? ""
          
          let address = "\(name) \(street), \(city), \(province), \(country)"
          print("Final address: \(address)")
          self.addressLabel.text = address
        }
      }
    }
  }
  
}

// CN Tower
// 43.642567, -79.387054

// Seneca - Newnham
// 43.7957894, -79.3489909
