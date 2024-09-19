//
//  RegistrationScreenOneViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/2/24.
//

import UIKit
import CoreData

class RegistrationScreenOneViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBackButtonClicked(_ sender: UIButton) {
        //TODO: Should load the sign in page (ViewController) class
    }
    
    
    @IBAction func onNextButtonClicked(_ sender: UIButton) {
        
//        // Getting the text from all text fields and putting it into local variables
//        let name = nameTextField.text ?? ""
//        let username = usernameTextField.text ?? ""
//        let email = emailTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//        let address = addressTextField.text ?? ""
//        let suite = suiteTextField.text ?? ""
//        let postalCode = postalCodeTextField.text ?? ""
//        
//        // Check to see if the fields are empty (suite is optional field so no need to check it)
//        if name.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || address.isEmpty || postalCode.isEmpty {
//            let alert = UIAlertController(title: "Error", message: "Please make sure that all required filled have been filled", preferredStyle: .alert)
//            
//            let okAction = UIAlertAction(title: "Ok", style: .default)
//            alert.addAction(okAction)
//            
//            self.present(alert, animated: true)
//        }
//        else {
//            // TODO: Verify that email and username isn't already in DB if not then segue to next screen and pass enetered data
//            
//            let doesUserExist: Bool = doesEmailAndUsernameExist(email: email, username: username)
//            
//            if doesUserExist {
//                let alert = UIAlertController(title: "Error", message: "A user with than email or username already exists. Please try again", preferredStyle: .alert)
//                
//                let okAction = UIAlertAction(title: "Ok", style: .default)
//                alert.addAction(okAction)
//                
//                self.present(alert, animated: true)
//            }
//            else{
//                //
//            }
//            
//        }
        
    }
    
    func doesEmailAndUsernameExist(email: String, username: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ OR username == %@", email, username)
        
        do {
            let matchingUser = try context.fetch(fetchRequest)
            return !matchingUser.isEmpty // Returns true if there are matching users
        } catch {
            print("Error comparing email and password")
            return true
            
        }
    }
    
}
