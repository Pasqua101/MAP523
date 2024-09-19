//
//  RegistrationScreenOneViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/2/24.
//

import UIKit
import CoreData

class RegistrationScreenOneViewController: UIViewController {

    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var suiteTextField: UITextField! //optional field
    @IBOutlet weak var postalCodeTextFIeld: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func onNextButtonClicked(_ sender: UIButton) {
        // Get text entered in text fields and see if required fields are empty
        let name: String = nameTextField.text ?? ""
        let username: String = usernameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        let address: String = addressTextField.text ?? ""
        let postalCode: String = postalCodeTextFIeld.text ?? ""
        let city: String = cityTextField.text ?? ""
        
        // if any of the above fields (other than suite) are empty, display an alert
        if name.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || address.isEmpty || postalCode.isEmpty || city.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please make sure all fields marked with * are filled", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else {
            
            // check to see if the enetered username and email exist
            let doesUserExist: Bool = doesEmailExist(email: email)
            print("Result = \(doesUserExist)")
            if doesUserExist {
                let alert = UIAlertController(title: "Error", message: "A user with than email already exists. Please try again", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
            }
            // If all conditions are satified then the app segues to the next screen
        }
        
    }
    
    func doesEmailExist(email: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let matchingUser = try context.fetch(fetchRequest)
            return !matchingUser.isEmpty // Returns true if there are matching, false otherwise
        } catch {
            print("Error comparing email")
            return true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadRegisterPartTwo" {
            if let registerPartTwo = segue.destination as? RegistrationScreenTwoViewController {
                // Passing the entered data to the next screen
                registerPartTwo.name = nameTextField.text
                registerPartTwo.username = usernameTextField.text
                registerPartTwo.email = emailTextField.text
                registerPartTwo.password = passwordTextField.text
                registerPartTwo.address = addressTextField.text
                registerPartTwo.postalCode = postalCodeTextFIeld.text
                registerPartTwo.city = cityTextField.text
            }
        }
    }
}
