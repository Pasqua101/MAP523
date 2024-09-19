//
//  EmployeeView.swift
//  SwiftUILecture
//
//  Created by user256704 on 4/16/24.
//

import SwiftUI

struct EmployeeView: View {
  
  let employee: Employee
  
  var body: some View {
    VStack {
      HStack {
        Text("Employee:")
          
        Spacer()
        
        Text(employee.name)
          .bold()
      }
      
      HStack {
        Text("Age:")
          
        Spacer()
        
        Text(String(employee.age))
          .bold()
      }
      
      HStack {
        Text("Status:")
          
        Spacer()
        
        Text(String(employee.isPresent ? "Present" : "Absent"))
          .bold()
      }
    }
    .font(.system(size: 21))
    .padding([.horizontal], 50)
  }
}

struct EmployeeView_Previews: PreviewProvider {
  static var previews: some View {
    EmployeeView(employee: Employee(name: "Test name", age: 20, isPresent: true))
  }
}
