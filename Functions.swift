// Learning Objectives 370-380

import Foundation

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "."
    return greeting
}

print(greet(person: "Ana"))

func sayHelloWorld() -> String {
    return "Hello World."
}

print(sayHelloWorld())

func greetNoReturn(person: String) {
  print("Hello, \(person)!")
}

greetNoReturn(person: "Dana")

// Objective 373
func greeting(for person: String) -> String {
  "Hello, " + person + "?"
}

print(greeting(for: "Nana"))

// Objective 374
func greetComplete(person: String, from hometown: String) -> String {
    let greeting = "Hello \(person)! Glad you could visit from \(hometown)."
    return greeting
}

print(greetComplete(person: "Jana", from: "Belém"))

// Objective 375
func omit(_ name: String, lastName: String) {
    print("Hi \(name) \(lastName)!")
}

omit("Larissa", lastName: "Uchôa")
