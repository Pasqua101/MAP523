//
//  CustomerDetailsViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/3/24.
//

import UIKit
import MapKit
import CoreData


class CustomerDetailsViewController: UIViewController {

    var user: User?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var statusList: [String] = ["AWAITED", "FAILEDTOREACH", "ONBOARDED", "INPROCESS", "COMPLETED", "DENIED"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up UI elements
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        usernameLabel.text = user?.username
        phoneLabel.text = user?.phone
        websiteLabel.text = user?.website
        companyNameLabel.text = user?.companyName
        catchPhraseLabel.text = user?.companyCatchPhrase
        bsLabel.text = user?.companyBs
        statusLabel.text = user?.processStatus
        addressLabel.text = user?.street
        // If the suite is not empty then set the text
        if user?.suite != "" {
            suiteLabel.text = user?.suite
        }
        cityLabel.text = user?.city
        postalCodeLabel.text = user?.zipcode
        
        // Displaying user's location on the map
        displayLocationOnMap()
    }
    
    func updateUsersStatus(email: String, processStatus: String) -> Bool {
        let fetchRequst: NSFetchRequest<User> = User.fetchRequest()
        fetchRequst.predicate = NSPredicate(format: "email == %@", email) // query to find the user with their email
        
        do {
            let user = try context.fetch(fetchRequst)
            // After executing the query, grab the user and update their status
            let foundUser = user.first
            foundUser?.processStatus = processStatus
            try context.save() // try saving the user
            print("User updated")
            return true
        } catch {
            print("Unable to update the user")
            return false
        }
    }
    
    func displayLocationOnMap(){
        guard let user = user else {
            return
        }
        
        if let latitudeString = user.lat, let longitudeString = user.lng,
           let latitude = Double(latitudeString), let longitude = Double(longitudeString) {
            // Creating coordinates from the user's lat and long
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            // Creating an annotation with the user's name and adding it on the map
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = user.name
            mapView.addAnnotation(annotation)
            
            // Setting the map's region to show user's location with a suitable span
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            
        } else {
            // Handle cases where latitude or longitude string is nil or conversion fails
            print("unable to convert the lat or long to a double")
        }
        
        
    }
    
    @IBAction func onUpdateButtonClicked(_ sender: UIButton) {
        let wasUserUpdate = updateUsersStatus(email: emailLabel.text ?? "", processStatus: statusLabel.text ?? "")
        
        // If update was successful alert the admin
        if wasUserUpdate {
            
            let alert = UIAlertController(title: "Success", message: "User was updated", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
        // If update was not successful alert the admin
        else{
            let alert = UIAlertController(title: "Error", message: "Unable to update the user. Please try again later", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        statusLabel.text = statusList[Int(sender.value)]
    }
}
