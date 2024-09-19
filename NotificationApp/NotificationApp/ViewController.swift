//
//  ViewController.swift
//  NotificationApp
//
//  Created by user256704 on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
  
  var toDoItems: [ToDoItem] = [] {
    didSet { tableView.reloadData() }
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
    
    func scheduleNotification(for item: ToDoItem) {
        let content = UNMutableNotificationContent()
        content.title = "ToDo Reminder"
        content.body = "Don't forget: \(item.title)"
        content.sound = .default
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: item.deadline)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: item.title, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
            print("Error scheduling notification: \(error)")
          }
        }
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addToDoVC = segue.destination as? AddToDoVC else { return }
        addToDoVC.onSave = { [weak self] newItem in
          self?.toDoItems.append(newItem)
          self?.scheduleNotification(for: newItem)
        }
      }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoTVCell
    else { return UITableViewCell() }
    
    let toDoItem = toDoItems[indexPath.row]
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy HH:mm"
    let formattedDate = formatter.string(from: toDoItem.deadline)
    
    cell.titleLabel.text = toDoItem.title
    cell.dateLabel.text = formattedDate
    
    return cell
  }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          // Cancel the notification
          let item = toDoItems[indexPath.row]
          UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.title])
          
          // Remove the item from your data source
          toDoItems.remove(at: indexPath.row)
        }
      }
}
