//
//  ViewController.swift
//  Assignment 4
//
//  Created by user256704 on 3/30/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //set the email and password fields to be empty
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func onLoginButtonClicked(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            
            let alert = UIAlertController(title: "Error", message: "Please make sure that the email and password field are not empty", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else {
            if let foundUser = fetchUser(email: email, password: password) {
                if foundUser.isAdmin == true {
                    // segue to admin screen
                    print("Admin Found")
                    performSegue(withIdentifier: "showAdminHomeScreen", sender: nil)
                }
                else {
                    // segue to customer screen
                    print("Customer found")
                    performSegue(withIdentifier: "showCustomerHomeScreen", sender: nil)
                }
            } else {
                // show an alert saying user was not found
                let alert = UIAlertController(title: "Error", message: "User not found, please make sure you entered your correct password and email", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCustomerHomeScreen" {
            if let customerHomeScreen = segue.destination as? CustomerHomeViewController {
                customerHomeScreen.email = emailTextField.text // send the entered email over to grab the user's info
            }
        }
        else if segue.identifier == "showAdminHomeScreen" {
            if let adminHomeScreen = segue.destination as? AdminHomeViewController {
                
            }
        }
    }
    
    func addAdmin(name: String, username: String, email: String, password: String) {
        let admin = User(context: context)
        
        admin.name = name
        admin.email = email.lowercased()
        admin.password = password
        admin.isAdmin = true
        
        do {
            try context.save()
            print("Admin saved")
        } catch {
            print("Admin unable to be saved")
        }
    }
    
    // Finds the user and returns a user object which we will use to determine if the user is an admin or not
    func fetchUser(email: String, password: String) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password) // creating a query to find a user with the provided email and password
        
        do {
            let users = try context.fetch(fetchRequest)
            return users.first // Returns the first user found (which shouldn't matter since the email is unique and there will only be one user)
        }
        catch {
            print("Error fetching user")
            return nil
        }
    }
}

