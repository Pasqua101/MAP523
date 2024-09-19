//
//  Emp+CoreDataProperties.swift
//  CoreDataClass19TableViews
//
//  Created by user256704 on 3/27/24.
//
//

import Foundation
import CoreData


extension Emp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emp> {
        return NSFetchRequest<Emp>(entityName: "Emp")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var phone: String?

}

extension Emp : Identifiable {

}
