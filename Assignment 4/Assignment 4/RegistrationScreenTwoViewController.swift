//
//  RegistrationScreenTwoViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/3/24.
//

import UIKit
import CoreLocation

class RegistrationScreenTwoViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data passed from the first screen
    var name: String?
    var username: String?
    var email: String?
    var password: String?
    var address: String?
    var suite: String?
    var postalCode: String?
    var city: String?
    
    let geocoder = CLGeocoder()
    
    // Outlet variables
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var companyCatchPhraseTextField: UITextField!
    @IBOutlet weak var companyBsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignUpButtonClicked(_ sender: UIButton) {
        
        // Get entered text from the fields
        let phone = phoneTextField.text ?? ""
        let website = websiteTextField.text ?? ""
        let company = companyTextField.text ?? ""
        let catchPhrase = companyCatchPhraseTextField.text ?? ""
        let bs = companyBsTextField.text ?? ""
        
        if phone.isEmpty || website.isEmpty || company.isEmpty || catchPhrase.isEmpty || bs.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please make sure that all fields marked with * are filled", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else {
            let wasUserAdded: Bool = addUser(name: name ?? "",
                                             username: username ?? "", email: email ?? "", password: password ?? "",
                                             address: address ?? "",
                                             suite: suite ?? "",
                                             postalCode: postalCode ?? "",
                                             phone: phone, 
                                             website: website,
                                             company: company,
                                             catchPhrase: catchPhrase,
                                             bs: bs,
                                             city: city ?? "")
            
            // If there was a failure to add the user then show an alert
            if !wasUserAdded {
                let alert = UIAlertController(title: "Error", message: "Unable to register your account. Please try again later", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Success", message: "Your account was successfully registered", preferredStyle: .alert)
                
                // Handler performs segue when clicked
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in self.performSegue(withIdentifier: "loadCustomerHomeScreenAfterRegister", sender: nil)})
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
            }
        }
        
    }
    
    func addUser(name: String, username: String, email: String, password: String, address: String, suite: String, postalCode: String, phone: String, website: String, company: String, catchPhrase: String, bs: String, city: String) -> Bool {
        // Create userobject and pass eneter values to the object
        let user = User(context: context)
        
        user.isAdmin = false
        user.name = name
        user.username = username
        user.email = email.lowercased()
        user.password = password
        user.street = address
        user.suite = suite
        user.zipcode = postalCode
        user.phone = phone
        user.website = website
        user.companyName = company
        user.companyCatchPhrase = catchPhrase
        user.companyBs = bs
        user.processStatus = "AWAITED"
        user.city = city
        
        // Forward geocode the address
        let addressString = "\(address), \(city), \(postalCode)"
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            guard let placemark = placemarks?.first else {
                print("Error geocoding address")
                return
            }
            user.lat = String(placemark.location?.coordinate.latitude ?? 0.0)
            user.lng = String(placemark.location?.coordinate.longitude ?? 0.0)
        }
        
        // try to save user, if user was saved return true, false otherwise
        do {
            try context.save()
            print("User saved")
            return true
        } catch {
            print("User unable to be saved")
            return false
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadCustomerHomeScreenAfterRegister" {
            if let customerHomeScreen = segue.destination as? CustomerHomeViewController {
                customerHomeScreen.email = email
            }
        }
    }
    
}
