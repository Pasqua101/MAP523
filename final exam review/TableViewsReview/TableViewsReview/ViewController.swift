//
//  ViewController.swift
//  TableViewsReview
//
//  Created by user256704 on 4/13/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

//    @IBOutlet weak var itemsTableView: UITableView!
//    
//    var items = ["Item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 7","Item 8","Item 9","Item 10","Item 11","Item 12","Item 13","Item 14","Item 15","Item 16","Item 17","Item 18","Item 19","Item 20","Item 21","Item 22","Item 23","Item 24","Item 25","Item 26","Item 27","Item 28","Item 29","Item 30","Item 31","Item 32","Item 33","Item 34","Item 35","Item 36","Item 37","Item 38","Item 39","Item 40","Item 41","Item 42","Item 43","Item 44","Item 45","Item 46","Item 47","Item 48","Item 49","Item 50"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1 // 1 by default
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let itemCell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
//        
//        itemCell.textLabel?.text = items[indexPath.row]
//        
//        return itemCell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Items"
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//      // remove the item from the array
//        items.remove(at: indexPath.row)
//
//        // remove the item from the tableView
//      tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
//    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//      
//      let deleteAction = UIContextualAction(style: .destructive, title:  "", handler: { (_, _, success:(Bool) -> Void) in
//        
//        self.items.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//        success(true)
//      })
//      deleteAction.image = UIImage(systemName: "trash")
//      deleteAction.backgroundColor = .systemRed
//      
//      let infoAction = UIContextualAction(style: .normal, title:  "", handler: { (_, _, success:(Bool) -> Void) in
//        
//        print(self.items[indexPath.row])
//        success(true)
//      })
//      infoAction.image = UIImage(systemName: "info.circle")
//      infoAction.backgroundColor = .systemBlue
//      
//      
//      return UISwipeActionsConfiguration(actions: [deleteAction, infoAction])
//    }
//    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//      let infoAction = UIContextualAction(style: .normal, title:  "", handler: { (_, _, success:(Bool) -> Void) in
//        
//        print(self.items[indexPath.row])
//        success(true)
//      })
//      infoAction.image = UIImage(systemName: "info.circle")
//      infoAction.backgroundColor = .systemBlue
//      
//      
//      return UISwipeActionsConfiguration(actions: [infoAction])
//    }
    
    // Implementation with accessoryType being used. EX, check marks show up when a row is clicked
    @IBOutlet weak var itemsTableView: UITableView!
    var items = [
      ["item":"Item 01", "selected": false],
      ["item":"Item 02", "selected": false],
      ["item":"Item 03", "selected": false],
      ["item":"Item 04", "selected": false],
      ["item":"Item 05", "selected": false],
      ["item":"Item 06", "selected": false],
      ["item":"Item 07", "selected": false],
      ["item":"Item 08", "selected": false],
      ["item":"Item 09", "selected": false],
      ["item":"Item 10", "selected": false],
      ["item":"Item 11", "selected": false],
      ["item":"Item 12", "selected": false],
      ["item":"Item 13", "selected": false],
      ["item":"Item 14", "selected": false],
      ["item":"Item 15", "selected": false],
      ["item":"Item 16", "selected": false],
      ["item":"Item 17", "selected": false],
      ["item":"Item 18", "selected": false],
      ["item":"Item 19", "selected": false],
      ["item":"Item 20", "selected": false],
      ["item":"Item 21", "selected": false],
      ["item":"Item 22", "selected": false],
      ["item":"Item 23", "selected": false],
      ["item":"Item 24", "selected": false],
      ["item":"Item 25", "selected": false],
      ["item":"Item 26", "selected": false],
      ["item":"Item 27", "selected": false],
      ["item":"Item 28", "selected": false],
      ["item":"Item 29", "selected": false],
      ["item":"Item 30", "selected": false],
      ["item":"Item 31", "selected": false],
      ["item":"Item 32", "selected": false],
      ["item":"Item 33", "selected": false],
      ["item":"Item 34", "selected": false],
      ["item":"Item 35", "selected": false],
      ["item":"Item 36", "selected": false],
      ["item":"Item 37", "selected": false],
      ["item":"Item 38", "selected": false],
      ["item":"Item 39", "selected": false],
      ["item":"Item 40", "selected": false],
      ["item":"Item 41", "selected": false],
      ["item":"Item 42", "selected": false],
      ["item":"Item 43", "selected": false],
      ["item":"Item 44", "selected": false],
      ["item":"Item 45", "selected": false],
      ["item":"Item 46", "selected": false],
      ["item":"Item 47", "selected": false],
      ["item":"Item 48", "selected": false],
      ["item":"Item 49", "selected": false],
      ["item":"Item 50", "selected": false]
    ]

    override func viewDidLoad() {
      super.viewDidLoad()
      itemsTableView.dataSource = self
      itemsTableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
      
      if let item = items[indexPath.row]["item"] as? String,
         let selected = items[indexPath.row]["selected"] as? Bool {
        
        itemCell.textLabel?.text = item
        if selected {
          itemCell.accessoryType = .checkmark
        } else {
          itemCell.accessoryType = .none
        }
      }
      
      return itemCell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "Items"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let selected = items[indexPath.row]["selected"] as? Bool else {
        return
      }
      items[indexPath.row]["selected"] = !selected
      tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


