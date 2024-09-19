//
//  ViewController.swift
//  Class18CoreData
//
//  Created by user256704 on 3/27/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // We need to grab context to perform CRUD operations. It is a reference to Core Data's managed context variable
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Check AppDelegate file for other steps
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        addEmployee(name: "John", age: 35, department: "Frontend")
//        fetchAllEmployees(age: 35)
//        updateEmployee()
        deleteEmployee()
    }

    func addEmployee(name: String, age: Int, department: String) {
        //1. create an employee object
        let emp = Employee(context: context)
        
        //2. set the properties of that object
        emp.name = name
        emp.age = Int16(age)
        emp.department = department
        
        //3. Use context variable to save the employee to the DB table
        do {
            try context.save()
            print("Employee saved!")
        }
        catch {
            print("Save failed")
        }
    }
    
    // Note on using NSFetchRequest. Must import CoreData
    func fetchAllEmployees() {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        
        do {
          let employees = try context.fetch(fetchRequest)
          
          for emp in employees {
            print(emp.name ?? "")
            print(emp.age)
            print(emp.department ?? "")
            print("-----------")
          }
        } catch {
          print("Failed to fetch employees")
        }
      }
    
    // Filtering a Fetch
    func fetchAllEmployees(age: Int) {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"age <= %@", "\(age)")
        
        do {
          let employees = try context.fetch(fetchRequest)
          
          for emp in employees {
            print(emp.name ?? "")
            print(emp.age)
            print(emp.department ?? "")
            print("-----------")
          }
        } catch {
          print("Failed to fetch employees")
        }
      }
    
    func updateEmployee() {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        
        do {
          let employees = try context.fetch(fetchRequest)
          
          let firstEmp = employees.first
          firstEmp?.age = 30
          
          try context.save()
          print("Employee updated")
        } catch {
          print("Failed to update employee")
        }
      }
    
    func deleteEmployee() {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        
        do {
          let employees = try context.fetch(fetchRequest)
          
          if let lastEmp = employees.last {
            context.delete(lastEmp)
          }
          
          try context.save()
          print("Employee deleted")
        } catch {
          print("Failed to delete employee")
        }
      }
}

