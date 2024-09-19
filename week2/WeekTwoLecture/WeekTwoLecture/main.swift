//
//  main.swift
//  WeekTwoLecture
//
//  Created by user254601 on 1/17/24.
//

import Foundation

var name = "Michael" //Also the option of using let instead of var. However, let does not allow us to change variable after

//String interpolation

name = "Marco"
print("Hello \(name)")


var counter = 0
print("Counter: \(counter)")
counter += 1 //You can't use counter++
print("Counter:\(counter)")


//Data types
//No need to give a type to variable, it automatically decides it

//Explicitly assign a data type like so
var isNumber: Bool = true

var isValid: Bool = false


var num1: Double = 5.2
var num2: Double = 2.3

print(num1 + num2)


//Conditionals

let age = 25
if (age >= 14 && age <= 21){
    print("You can drive")
}
else if (age > 21){
    print("You can vote")
}
else{
    print("You can not drive")
}


//Switch

let weather = "Snowy"

switch weather{
case "Rainy":
    print("Bring an umbrella")
case "Snowy", "icy", "hailstorm", "windy":
    print("Bring a jacket")
case "Sunny":
    print("It's sunny")
default:
    print("Sorry, but I don't know what to do with that")
}

