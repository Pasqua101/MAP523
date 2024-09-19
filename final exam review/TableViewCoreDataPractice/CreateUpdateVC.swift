//
//  CreateUpdateVC.swift
//  TableViewCoreDataPractice
//
//  Created by user256704 on 4/16/24.
//

import UIKit
import Foundation

class CreateUpdateVC: UIViewController {
  
  var emp:Emp?
  
  private let nameTextField:UITextField = {
    let textField = UITextField()
    textField.placeholder = "Full Name"
    textField.textAlignment = .center
    textField.borderStyle = .roundedRect
    textField.backgroundColor = .systemFill
    textField.autocorrectionType = .no
    return textField
  }()
  
  private let ageTextField:UITextField = {
    let textField = UITextField()
    textField.placeholder = "Age"
    textField.textAlignment = .center
    textField.borderStyle = .roundedRect
    textField.backgroundColor = .systemFill
    return textField
  }()
  
  private let phoneTextField:UITextField = {
    let textField = UITextField()
    textField.placeholder = "Phone Number"
    textField.textAlignment = .center
    textField.borderStyle = .roundedRect
    textField.backgroundColor = .systemFill
    return textField
  }()
  
  private let saveButton:UIButton = {
    let button = UIButton()
    button.setTitle("Save", for: .normal)
    button.backgroundColor = .systemGreen
    button.layer.cornerRadius = 6
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    
    view.addSubview(nameTextField)
    view.addSubview(ageTextField)
    view.addSubview(phoneTextField)
    view.addSubview(saveButton)
    
    if let emp = emp {
      nameTextField.text = emp.name
      ageTextField.text = String(emp.age)
      phoneTextField.text = emp.phone
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    nameTextField.frame = CGRect(x: 40, y: view.safeTop + 40, width: view.width - 80, height: 40)
    ageTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
    phoneTextField.frame = CGRect(x: 40, y: ageTextField.bottom + 20, width: view.width - 80, height: 40)
    saveButton.frame = CGRect(x: 40, y: phoneTextField.bottom + 20, width: view.width - 80, height: 40)
  }
  
  @objc private func saveButtonTapped() {
    
    let name = nameTextField.text!
    let age = Int(ageTextField.text!)!
    let phone = phoneTextField.text!
    
    if let emp = emp {
      
      CoreDataHandler.shared.update(emp: emp, name: name, age: age, phone: phone) { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }
    } else {
      
      CoreDataHandler.shared.insert(name: name, age: age, phone: phone) { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }
    }
  }
}

extension UIView {
  public var width: CGFloat { return frame.size.width }
  public var height: CGFloat { return frame.size.height }
  public var top: CGFloat { return frame.minY }
  public var bottom: CGFloat { return frame.maxY }
  public var left: CGFloat { return frame.minX }
  public var right: CGFloat { return frame.maxX }
  public var safeTop: CGFloat { return safeAreaInsets.top }
}
