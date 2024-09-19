//
//  CoreDataHandler.swift
//  CoreDataClass19TableViews
//
//  Created by user256704 on 3/27/24.
//

import Foundation
import UIKit
import CoreData

class CoreDataHandler {
  
  /// shared instance of class
  static let shared = CoreDataHandler()
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  var context: NSManagedObjectContext?
  
  private init() {
    context = appDelegate.persistentContainer.viewContext
  }
  
  func saveContext() {
    appDelegate.saveContext()
  }
  
  func insert(name:String, age:Int, phone:String, completion: @escaping () -> Void) {
    
    let emp = Emp(context: context!)
    emp.name = name
    emp.age = Int64(age)
    emp.phone = phone
    
    saveContext()
    completion()
  }
  
  func update(emp:Emp, name:String, age:Int, phone:String, completion: @escaping () -> Void) {
    
    emp.name = name
    emp.age = Int64(age)
    emp.phone = phone
    
    saveContext()
    completion()
  }
  
  /// Returns an array of Emp (Core Data obj)
  func fetchData() -> Array<Emp> {
    let fetchRequest: NSFetchRequest<Emp> = Emp.fetchRequest()
    do {
      let emp = try context?.fetch(fetchRequest)
      return emp!
    } catch {
      print(error.localizedDescription)
      // Returning an empty Array - Error Handling
      let emp = Array<Emp>()
      return emp
    }
  }
  
  func deleteData(for emp:Emp, completion: @escaping () -> Void) {
    
    context!.delete(emp)
    saveContext()
    completion()
  }
}
