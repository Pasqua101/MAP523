//
//  Employee.swift
//  TableViewCellsReview
//
//  Created by user256704 on 4/13/24.
//

import Foundation

class Employee {
    var name: String
    var team: String
    
    init(name: String, team: String) {
        self.name = name
        self.team = team
    }
    
}

enum Team: String, CaseIterable {
  case Frontend = "Frontend"
  case Backend = "Backend"
  case Product = "Product"
  case Design = "Design"
  case Testing = "Testing"
}
// CaseIterable is required if you want to iterate on the enum
