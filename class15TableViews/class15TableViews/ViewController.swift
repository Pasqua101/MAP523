//
//  ViewController.swift
//  class15TableViews
//
//  Created by user256704 on 3/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    
    var items = ["Item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 7","Item 8","Item 9","Item 10","Item 11","Item 12","Item 13","Item 14","Item 15","Item 16","Item 17","Item 18","Item 19","Item 20","Item 21","Item 22","Item 23","Item 24","Item 25","Item 26","Item 27","Item 28","Item 29","Item 30","Item 31","Item 32","Item 33","Item 34","Item 35","Item 36","Item 37","Item 38","Item 39","Item 40","Item 41","Item 42","Item 43","Item 44","Item 45","Item 46","Item 47","Item 48","Item 49","Item 50"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // If not implemented by default the number of sections is 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Setting the number of rows in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        
        itemCell.textLabel?.text = items[indexPath.row]
        
        return itemCell
    }
    
    
    // Setting a header for the section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Items"
    }
    
    // Implementing ability to delete a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // remove the item from the array
        items.remove(at: indexPath.row)
        
        // remove the item from the tableview
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    // Implementing custom trailing swipe animations
    
}

