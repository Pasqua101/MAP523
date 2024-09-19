//
//  ListView.swift
//  SwiftUILecture
//
//  Created by user256704 on 4/16/24.
//

import SwiftUI

struct ListView: View {
    // Uncomment below code if not using the sections part of the code in the employee file
//    let employees: [Employee] = [
//        Employee(name: "John", team: "Frontend"),
//        Employee(name: "Jane", team: "Backend"),
//        Employee(name: "Mike", team: "Product"),
//        Employee(name: "Sarah", team: "Design"),
//        Employee(name: "Tom", team: "Testing")
//      ]
      
    //If using identifiable, you do not need id: \.self
//      var body: some View {
//          List(employees, id: \.self) { employee in
//          Text("\(employee.name) \t - \t \(employee.team)")
//        }
//      }
    
    // Code below is for sections and custom rows
    var teams: [Team] = [
        Team(name: "Frontend", employee: [Employee(name: "John", age: 40, isPresent: false), Employee(name: "Jane", age: 35, isPresent: true)]),
        Team(name: "Backend", employee: [Employee(name: "Jane", age: 35, isPresent: true)]),
        Team(name: "Product", employee: [Employee(name: "Mike", age: 21, isPresent: true)]),
        Team(name: "Design", employee: [Employee(name: "Sarah", age: 21, isPresent: false), Employee(name: "Ravi", age: 25, isPresent: true)]),
        Team(name: "Testing", employee: [Employee(name: "Tom", age: 30, isPresent: true)]),
      ]
      
    var body: some View {
        NavigationStack{
            List {
                ForEach(teams) { team in
                    Section(team.name) {
                        ForEach(team.employee, id: \.self) { employee in
                            NavigationLink {
                                // destination
                                EmployeeView(employee: employee)
                            } label: {
                                //Link
                                EmployeeRow(employee: employee)
                            }
//                            //                Text(employee.name)
//                            EmployeeRow(employee: employee) // Allows for custom rows
                        }
                    }
                }
            }
            .navigationTitle("Employees") //Gives a title to the screen
            .listStyle(.grouped) // styles the way elements are grouped on the list. Must use NavigationStack to use the code on line 48 and 49
        }
    }
}
// Displays a preview on the right hand side of the screen
struct ListView_Previes: PreviewProvider{
    static var previews: some View {
        ListView()
    }
}


//#Preview {
//    ListView()
//}
