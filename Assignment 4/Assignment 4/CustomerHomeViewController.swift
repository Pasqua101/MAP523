//
//  CustomerHomeViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/3/24.
//

import UIKit
import CoreData


class CustomerHomeViewController: UIViewController {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // email variable hold passed data from login and register screen. This will allow us to fetch data about the user from the DB and load the fields
    var email: String?
    
    // UI elements
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var suiteTextField: UITextField!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var bsTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var catchPhraseTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailLabel.text = email
        let foundUser = fetchUserByEmail(email: email ?? "")
        
        // If user was not found, display an alert
        if foundUser == nil {
            let alert = UIAlertController(title: "Error", message: "An error occured unable to fetch your account information. Please try again later.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
        else {
            nameTextFIeld.text = foundUser?.name
            usernameTextField.text = foundUser?.username
            passwordTextField.text = foundUser?.password
            addressTextField.text = foundUser?.street
            
            // If the suite field is not empty then set the text in the textfield
            if foundUser?.suite != "" {
                suiteTextField.text = foundUser?.suite
            }
            
            postalCodeTextField.text = foundUser?.zipcode
            companyNameTextField.text = foundUser?.companyName
            bsTextField.text = foundUser?.companyBs
            phoneTextField.text = foundUser?.phone
            websiteTextField.text = foundUser?.website
            catchPhraseTextField.text = foundUser?.companyCatchPhrase
            statusLabel.text = foundUser?.processStatus
            
            // Switch statement to set the colour of the statusLabel's text based on the process status
            if let processStatus = foundUser?.processStatus {
                switch processStatus{
                case "AWAITED":
                    statusLabel.textColor = UIColor.yellow
                case "FAILEDTOREACH":
                    statusLabel.textColor = UIColor.red
                case "ONBOARDED":
                    // Show a light green
                    statusLabel.textColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1.0)
                case "INPROCESS":
                    statusLabel.textColor = UIColor.green
                case "COMPLETED":
                    statusLabel.textColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1.0)
                default:
                    break
                }
                
            }
            
            if statusLabel.text == "AWAITED" {
                statusLabel.textColor = UIColor.yellow
            }
        }
    }
    
    @IBAction func onSaveButtonClicked(_ sender: UIButton) {
        
        
        // grab the text in the fields and make sure it isn't empty before passing it off to be updated
        let email = emailLabel.text ?? ""
        let name = nameTextFIeld.text ?? ""
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let address = addressTextField.text ?? ""
        let suite = suiteTextField.text ?? ""
        let postalCode = postalCodeTextField.text ?? ""
        let companyName = companyNameTextField.text ?? ""
        let bs = bsTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let website = websiteTextField.text ?? ""
        let catchPhrase = catchPhraseTextField.text ?? ""
        
        if name.isEmpty || username.isEmpty || password.isEmpty || address.isEmpty || postalCode.isEmpty || companyName.isEmpty || bs.isEmpty || phone.isEmpty || website.isEmpty || catchPhrase.isEmpty {
            
            let alert = UIAlertController(title: "Error", message: "Please make sure that all fields marked with * are filled", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
        
        // While email shouldn't be empty, we'll do this check as a safe guard
        if email.isEmpty {
            let alert = UIAlertController(title: "Error", message: "It seems that you are not correctly logged in. Please restart the app or contact support", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
        else {
            let wasUserUpdated = updateUser(email: email,
                                            name: name,
                                            username: username,
                                            password: password,
                                            address: address,
                                            suite: suite,
                                            postalCode: postalCode,
                                            companyName: companyName,
                                            bs: bs,
                                            phone: phone,
                                            website: website,
                                            catchPhrase: catchPhrase)
            
            // if update was successful alert the user
            if wasUserUpdated {
                let alert = UIAlertController(title: "Success", message: "Update was successful", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
            // if update was not successful, alert user
            else{
                let alert = UIAlertController(title: "Error", message: "Unable to update your account, please try again later", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
            }
        }
        
        
    }
    
    func fetchUserByEmail(email: String) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email) // creating a query to find the user
        
        do {
            let user = try context.fetch(fetchRequest)  // executing query
            return user.first
        }
        catch {
            print("Error fetching user")
            return nil
        }
    }
    
    func updateUser(email: String, name: String, username: String, password: String, address: String, suite: String, postalCode: String, companyName: String, bs: String, phone: String, website: String, catchPhrase: String) -> Bool {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email) // Create a query to find user
        do{
            let users = try context.fetch(fetchRequest) // execute query
            
            // Update the user's info after grabbing them from the fetch
            let foundUser = users.first
            
            foundUser?.name = name
            foundUser?.username = username
            foundUser?.password = password
            foundUser?.street = address
            foundUser?.suite = suite
            foundUser?.zipcode = postalCode
            foundUser?.companyName = companyName
            foundUser?.companyBs = bs
            foundUser?.phone = phone
            foundUser?.website = website
            foundUser?.companyCatchPhrase = catchPhrase
            
            try context.save() // try updating their info
            print("User updated")
            return true
        }
        catch {
            print("Failed to update user")
            return false
        }
    }

}
