//
//  ViewController.swift
//  TableViewCellsReview
//
//  Created by user256704 on 4/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    
    var employees: [Employee] = [
        Employee(name: "John", team: "Frontend"),
        Employee(name: "Jane", team: "Backend"),
        Employee(name: "Mike", team: "Product"),
        Employee(name: "Sarah", team: "Design"),
        Employee(name: "Tom", team: "Testing")
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Already assigned dataSource and Delegate in storyboard
//        employeeTableView.dataSource = self
//        employeeTableView.delegate = self
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as! EmpTableViewCell
        
        cell.empNameLabel.text = employees[indexPath.row].name
        cell.teamLabel.text = employees[indexPath.row].team
        
        cell.transferEmployee = {
            // transfer logic here
            self.changeTeam(for: indexPath.row) {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func changeTeam(for index: Int, completion: @escaping (() -> Void)) {
      let alert = UIAlertController(title: "Team Transfer", message: "Select the team you want to transfer to", preferredStyle: .actionSheet)
      
      for team in Team.allCases {
        let action = UIAlertAction(title: team.rawValue, style: .default) { _ in
          self.employees[index].team = team.rawValue
          completion()
        }
        
        alert.addAction(action)
      }
      
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      
      present(alert, animated: true)
    }
    // @escaping is used to inform callers of a function that takes a closure
    // that the closure might be stored or otherwise outlive the scope
    // of the receiving function.
}

