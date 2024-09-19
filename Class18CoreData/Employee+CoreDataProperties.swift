//
//  Employee+CoreDataProperties.swift
//  Class18CoreData
//
//  Created by user256704 on 3/27/24.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var age: Int16
    @NSManaged public var department: String?
    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
