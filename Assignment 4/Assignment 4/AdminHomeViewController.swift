//
//  AdminHomeViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/3/24.
//

import UIKit
import CoreData

class AdminHomeViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var customersTableView: UITableView!
    
    var usersList: [User] = []
    var selectedUser: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Fetch data from the database
        if let fetchedUsers = getAllUsersNoAdmin() {
            // Update the local list
            usersList = fetchedUsers
            customersTableView.reloadData()
            
        } else {
            // Handle the case where fetching data fails, if necessary
            print("Failed to fetch users from the database.")
        }
    }
    
    @IBAction func onLogoutButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) // Using dismiss to send the user back to the home screen (view controller) Only works if this controller is presented modally
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCustomerDetails" {
            if let customerDetailController = segue.destination as? CustomerDetailsViewController {
                // Pass selected user
                customerDetailController.user = selectedUser
            }
        }
    }
    
    // Grabs users who are not an admin
    func getAllUsersNoAdmin() -> [User]? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        // Making a query to find only users who are not an admin
        fetchRequest.predicate = NSPredicate(format: "isAdmin == false")
        
        do {
            let users = try context.fetch(fetchRequest)
            return users
        } catch {
            print("Unable to fetch users who aren't an admin")
            return nil
        }
    }
    
    // searches the db and deletes the user with the provided email
    func deleteUserWithEmail(email: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let user = try context.fetch(fetchRequest)
            
            if let foundUser = user.first{
                context.delete(foundUser)
            }
            
            try context.save()
            print("Employee deleted")
            return true
            
        } catch {
            print("Unable to delete user")
            return false
        }
        
    }
}


extension AdminHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // tableview methods (functions)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating an object to use the TableViewCell with the identifier of CustomerInfoCell
        let userCell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoCell", for: indexPath) as! CustomerDetailsTableViewCell
        
        //Setting the data in each row
        userCell.nameLabel.text = usersList[indexPath.row].name
        userCell.phoneLabel.text = usersList[indexPath.row].phone
        userCell.cityLabel.text = usersList[indexPath.row].city
        userCell.processStatusLabel.text = usersList[indexPath.row].processStatus
        
        // Customizing cell background colour based on process status
        switch usersList[indexPath.row].processStatus {
            case "AWAITED":
                userCell.backgroundColor = UIColor.yellow.withAlphaComponent(0.5) // Yellow tone
            case "FAILEDTOREACH":
                userCell.backgroundColor = UIColor.red.withAlphaComponent(0.2) // Light Red tone
            case "ONBOARDED":
                userCell.backgroundColor = UIColor.green.withAlphaComponent(0.2) // Light Green tone
            case "INPROCESS":
                userCell.backgroundColor = UIColor.green.withAlphaComponent(0.5) // Mid Green tone
            case "COMPLETED":
                userCell.backgroundColor = UIColor.green.withAlphaComponent(0.8) // Dark Green tone
            case "DENIED":
                userCell.backgroundColor = UIColor.red.withAlphaComponent(0.8) // Red
            default:
                userCell.backgroundColor = UIColor.clear // Default colour
        }
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // Swipe to delete function
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Delete Action
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, completion) in
            guard let self = self else { return }
            
            // Grab the selected index
            let selectedIndex = indexPath.row
            
            // Create an alert to ask the admin for confirmation
            let alert = UIAlertController(title: "Delete Users", message: "Are you sure you want to delete this user?", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelButton)
            
            let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
                // Remove the user from the DB
                let wasUserDeleted: Bool = self.deleteUserWithEmail(email: self.usersList[selectedIndex].email ?? "")
                
                // Check to see if delete was successful
                if wasUserDeleted {
                    // Remove the user from the list
                    self.usersList.remove(at: selectedIndex)
                    
                    // Remove the row from the table
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    
                    
                }
                else {
                    let alert = UIAlertController(title: "Error", message: "Unable to delete user. Please try again later", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                }
            }
            alert.addAction(deleteButton)
            self.present(alert, animated: true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedUser = usersList[indexPath.row]
        return indexPath
    }
}
