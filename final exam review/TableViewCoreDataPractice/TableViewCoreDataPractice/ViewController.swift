//
//  ViewController.swift
//  TableViewCoreDataPractice
//
//  Created by user256704 on 4/16/24.
//

import UIKit

class MainVC: UIViewController {
  
  private var empArray = Array<Emp>() {
    didSet{myTableView.reloadData()}
  }
  
  private let myTableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Employees"
    
    view.addSubview(myTableView)
    
    let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    navigationItem.setRightBarButton(addItem, animated: true)
    
    setupTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    empArray = CoreDataHandler.shared.fetchData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    myTableView.frame = view.bounds
  }
  
  @objc private func addButtonTapped() {
    let vc = CreateUpdateVC()
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
  
  private func setupTableView() {
    myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "empCell")
    myTableView.dataSource = self
    myTableView.delegate = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return empArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath)
    
    let content = "\(empArray[indexPath.row].name!) \t | \t \(empArray[indexPath.row].age) \t | \t \(empArray[indexPath.row].phone!)"
    
    cell.textLabel!.text = content
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(empArray[indexPath.row])
    
    let vc = CreateUpdateVC()
    vc.emp = empArray[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    CoreDataHandler.shared.deleteData(for: empArray[indexPath.row]) { [weak self] in
      print("Data deleted")
      //self?.fetchData()
      self?.empArray.remove(at: indexPath.row)
      //tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
}
