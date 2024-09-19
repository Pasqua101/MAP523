//
//  EmployeeRow.swift
//  SwiftUILecture
//
//  Created by user256704 on 4/16/24.
//

import SwiftUI

struct EmployeeRow: View {
  
  let employee: Employee
  
  var body: some View {
    HStack {
      Text(employee.name)
      Spacer()
      Image(systemName: "person.circle.fill")
        .foregroundColor(employee.isPresent ? .green : .red)
    }
  }
}

struct EmployeeRow_Previews: PreviewProvider {
  static var previews: some View {
    EmployeeRow(employee: Employee(name: "Test name", age: 21, isPresent: true))
  }
}
//#Preview {
//    EmployeeRow()
//}
