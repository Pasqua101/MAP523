//
//  AdminViewController.swift
//  Assignment 4
//
//  Created by user256704 on 4/1/24.
//

import UIKit
import CoreData

class AdminViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Admin view controller loaded")
//        print(fetchUsersWhoArentAdmin() ?? "No users found")
    }
    
    func fetchUsersWhoArentAdmin() -> [User]?{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isAdmin == nil OR isAdmin == false")
        
        do {
            let nonAdminusers = try context.fetch(fetchRequest)
            return nonAdminusers
        } catch {
            print ("Error finding users who aren't an admin")
            return nil
        }
    }
    

}
