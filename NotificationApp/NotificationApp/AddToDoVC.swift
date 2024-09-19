//
//  AddToDoVC.swift
//  NotificationApp
//
//  Created by user256704 on 4/16/24.
//

import UIKit

class AddToDoVC: UIViewController {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var deadlineDatePicker: UIDatePicker!
  
  var onSave: ((ToDoItem) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func addToDo(_ sender: UIButton) {
    guard let title = titleTextField.text, !title.isEmpty else { return }
    let deadline = deadlineDatePicker.date
    
    print(deadline)
    
    let newItem = ToDoItem(title: title, deadline: deadline)
    onSave?(newItem)
    self.navigationController?.popViewController(animated: true)
  }
}
