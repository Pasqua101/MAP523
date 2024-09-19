//
//  MapKitVC.swift
//  CoreLocationPractice
//
//  Created by user256704 on 4/16/24.
//

import UIKit

// MARK: 1. import MapKit
import MapKit

class MapVC: UIViewController {
  
  // MARK: 2. Create an outlet for your map
    
    @IBOutlet weak var mapView: MKMapView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: 3. Code to configure the map
    // See:  https://guides.codepath.com/ios/Maps#set-up-initial-properties
    
    // span  = describes the zoom level of your map
    // smaller numbers = more zoomed in
    // larger numbers = more zoomed out
    // 0.01 = street level zoom
    let zoomLevel = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    // region = visible area of the map --> center of your map
    let centerOfMap = CLLocationCoordinate2D(latitude: 43.7957894, longitude: -79.3489909)
    let visibleRegion = MKCoordinateRegion(center: centerOfMap, span: zoomLevel)
    
    // setup the map to show this region
    mapView.setRegion(visibleRegion, animated: true)
    
    // MARK: 4. Add a pin on the map
    // See: https://guides.codepath.com/ios/Maps#mkpointannotation
    let pin = MKPointAnnotation()
    pin.coordinate = centerOfMap
    pin.title = "Seneca College - Newnham Campus"
    mapView.addAnnotation(pin)
  }
  
}

// Seneca - Newnham
// 43.7957894, -79.3489909
