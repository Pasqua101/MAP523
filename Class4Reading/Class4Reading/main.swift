//
//  main.swift
//  Class4Reading
//
//  Created by user256704 on 1/25/24.
//

import Foundation

print("Hello, World!")

//Arrays (Creating empty arrays)
var arr1: [String] = []
var arr2 = [Int]()
var arr3 = Array<Double>()

print("arr1: \(arr1.count) elements")
print("arr2: \(arr2.count) elements")
print("arr3: \(arr3.count) elements")

//Creating array with default values
var ones = Array(repeating: 1, count: 3)
print(ones)

//Appending to array
var nums = [Int]()
nums.append(2)
nums += [4]
print(nums)

//Insert to an array
nums.insert(3, at: 1)
nums.insert(5, at: nums.count)

print(nums)

//Removing element from an array
nums.remove(at: 3)
print(nums)
let four = nums.remove(at: 2)
print(nums)
print(four)

//Iterating
let fruits : [String] = ["Apple", "Banana", "Orange", "Grapes"]
for fruit in fruits {
    print(fruit)
}

for (index, fruit) in fruits.enumerated() { // Returns index
    print("\(index): \(fruit)")
}


//Dictionaries (creation)
var textualNumbers = [Int: String]() //Uses key/value pairs
textualNumbers[1] = "one"
textualNumbers = [:] //[:]
print(type(of: textualNumbers))

//Retrieve
var stations = ["ST" : "Surat", "BRC" : "Baroda"]
print(stations["ABCD"] ?? "Not Found")

print(stations["ST"] ?? "Not Found")

//Insert
stations["JP"] = "Jaipur"
print(stations)

//Update
stations["BRC"] = "Vadodara"
print(stations)

//Remove
let surat = stations.removeValue(forKey: "ST")
print(stations)
print(surat ?? "Not Found")

stations["JP"] = nil
print(stations)


//Iterating
let meals = ["morning": "breakfast", "afternoon": "lunch", "evening": "dinner"]
for (time, meals) in meals {
    print("\(meals) in the \(time)")
}

//Iterating over keys
for time in meals.keys{
    print(time)
}

//Iterating over values
for meal in meals.values{
    print(meal)
}


//Optionals
//Note: used where value may be absent

let str = "123"
let num = Int(str)
print("num is of type: \(type(of: num))")

var serverResponse: Int? = 404
serverResponse = nil

var runs: Int? // runs = nil

//Optional Binding
//Note: used to check if an optional contains a value
//if yes, then make it available as a temp constant or variable
//can be ued with if statements
if let tempRuns = runs {
    print(tempRuns)
} else {
    print("no runs")
}

//and while loops

let nums2 = ["1", "2", "three", "4", "5"]
var counter = 0
while counter < nums.count, let num = Int?( nums[counter] ) {
  print(num)
  counter += 1
}

var mca = true
var marks = "30"
if mca, let score = Int(marks), score > 27 {
  print("Pass")
}

//Ternary operators
let experience = 2
let eligibility = experience > 5 ? "eligible" : "not eligible"

print("You are \(eligibility) to apply")
// You are not eligible to apply

//Nil coalescing operator
let country: String? = nil
print("Origin: \( country ?? "Unknown" )")
// Origin: Unknown

// Guard

func evenOdd(str: String) {
  guard let num = Int(str) else {
    print("Please enter a number")
    return
  }
  if num % 2 == 0 {
    print("Even")
  } else {
    print("Odd")
  }
}

evenOdd(str: "4")    // Even
evenOdd(str: "four") // Please enter a number
evenOdd(str: "5")    // Odd

//Object Oriented Programming (Read about classes first, xcode forced me to put protocols up here

//Protocol
//Defines blueprint of methods, properties and other requirements that suit a particular task or piece of functionality
//Acts as a contract for how an object should behave
//It can then be adopted by a class, structure or enumeration to provide an actual implementation of those requirements
//Any type that satisfies the requirements of a protocol is said to conform to the protocol

// Greetable.swift
protocol Greetable1 {
    var name: String { get set }
    func greet1()
}

//get-only
protocol Greetable2 {
    var name: String { get }
    func greet2()
}

//How to conform to a protocol

class Person  : Greetable1{
    var name: String
    var age: Int

    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func greet1() {
        print("Hello")
    }
}

// What if I want a get only property in a protocol
class Person2 : Greetable2{
    var name: String {return "Human"}
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
    func greet2() {
        print("Hello")
    }
}



//Classes

let d1 = Dog()
print(d1)
print(d1.age)
print(d1.name)
print(d1.breed)

let d2 = Dog(name: "Rover", breed: "Golden Retriever")
print("The second dog is name \(d2.name)")

let d3 = Dog(name: "Fido", age: 4, breed: "Bulldog", isSleeping: true)
print("The third dog is a \(d3.breed). Is \(d3.name) sleeping? \(d3.isSleeping)")
d3.sayHello()
d3.eatingDinner(favFood: "Apple")
d3.eatingDinner(favFood: "Dog snacks")
d3.eatingDinner(favFood: "Yogurt")

if(d3.wantsToPlay()){
    print("Let's take \(d3.name) to the park!")
}
else{
    print("\(d3.name) is sleeping and doesn't want to play")
}

print("How old is \(d3.name)? \(d3.ageInHumanYears)")
    

let john = Student(name: "John Smith", age: 20, major: "Computer Science")
let jane = Teacher(name: "Jane Doe", age: 35, subject: "English")

john.greet1()
jane.greet1()


//Sub classes/Inheritance
class Student : Person{
    var major: String
    
    init(name: String, age: Int, major: String){
        self.major = major
        super.init(name: name, age: age)
    }
    
    override func greet1() {
        print("Hi! My name is \(name). I majored in \(major).")
    }
    
    }
    
    // Teacher.swift
class Teacher: Person {
      var subject: String
      
      init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
      }
      
      override func greet1() {
        print("Hi! My name is \(name). I teach \(subject).")
      }
}

//Classes
class Dog{
    //properties (stored, which are the traditional property we are used to seeing, and computed properties that is unique to Swift/Kotlin)
    
    //These are stored properties
    var name: String = "Polo"
    var age: Int = 5
    var breed: String = "Poodle"
    var isSleeping: Bool = false
    
    //This is a computed property
    var ageInHumanYears:  Int {
        //This is the value that will be returned when someone tries to access this property
        get {
            return self.age * 7
        }
    }
    
    
    //initialize the class
    init(){ //Required that we must have default values for the properties by the time an object is created. We can either set these values in the init or assign it when defining the variables
    }
    
    //    Custom initaliziers
    init(name: String, breed: String){ //Can't use this init without assigning values to other properties when we create the variables
        self.name = name
        self.breed = breed
    }
    
    init(name: String, age: Int, breed: String, isSleeping: Bool){
        self.name = name
        self.age = age
        self.breed = breed
        self.isSleeping = isSleeping
    }
    
    //functions
    func sayHello(){
        print("WOOF! WOOF!")
    }
    
    func eatingDinner(favFood: String){
        print("\(self.name) is eating \(favFood)")
    }
    
    func wantsToPlay() -> Bool{
        if (self.isSleeping == false){
            return true
        }
        else{
            return false
        }
        //We could also do return !self.isSleeping
    }

}
