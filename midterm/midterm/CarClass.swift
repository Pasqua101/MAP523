//
//  CarClass.swift
//  midterm
//
//  Created by user256704 on 2/21/24.
//

import Foundation

class Car{
    
    //Properties
    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    //Computer property
    var fullDescription: String{
        return "\(make) \(model) \(year)"
    }
    
    func displayDetails(){
        print("Car's full details:")
        print("Make: \(make)")
        print("Model: \(model)")
        print("Year: \(year)" )
        print("Full description: \(fullDescription)")
    }
    
}

class ElectricCar: Car{
    //Properties
    var batteryRange: Double
    
    init(make: String, model: String, year: Int, batteryRange: Double) {
        self.batteryRange = batteryRange
        super.init(make: make, model: model, year: year)
    }
    
    
    override func displayDetails() {
        super.displayDetails()
        print("Battery Range: \(batteryRange)")
    }
}

let ford = Car(make: "Ford", model: "F-150", year: 2024)
let tesla = ElectricCar(make: "Tesla", model: "X", year: 2020, batteryRange: 250)

