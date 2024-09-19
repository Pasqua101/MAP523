//
//  User+CoreDataProperties.swift
//  Assignment 4
//
//  Created by user256704 on 4/1/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var isAdmin: Bool
    @NSManaged public var companyCatchPhrase: String?
    @NSManaged public var companyBs: String?
    @NSManaged public var id: Int64
    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
    @NSManaged public var processStatus: String?

}

extension User : Identifiable {

}
