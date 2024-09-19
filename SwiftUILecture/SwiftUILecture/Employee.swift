//
//  Employee.swift
//  SwiftUILecture
//
//  Created by user256704 on 4/16/24.
//

import Foundation

//struct Employee: Identifiable {
//    var id = UUID()
//    var name: String
//    var team: String
//}

// When using a list with switfUI each part of data must be uniquely identifiable. There are to methods. Identifiable (above) and Keypath (below)

//struct Employee: Hashable {
//  var name: String
//  var team: String
//}

// Trying out section
struct Team: Identifiable {
  var id = UUID()
  var name: String
  var employee: [Employee]
    
}

struct Employee: Hashable {
    var name: String
    var age: Int
    var isPresent: Bool
    
}
