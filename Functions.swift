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

// Objective 376
func sum(defaultt: Int, nonDefault: Int = 9) {
    print(defaultt + nonDefault)
}

sum(defaultt: 3)
sum(defaultt: 3, nonDefault: 18)


// Objective 379
func variadicSum(_ numbers: Int...) {
    var total = 0
    for number in numbers {
        total += number
    }
    print("Sum =", total)
}

variadicSum(1,2,3,4,5)

// Objective 380
func swapTwoInt(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var x = 3
var y = 303
print(x, y)
swapTwoInt(&x, &y)
print(x, y)

// Objective 377
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a*b
}

// Variável utilizada como function type da função multiplyTwoInts
var mathFunction: (Int, Int) -> Int = multiplyTwoInts
print("Resultado: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Resultado: \(mathFunction(4, 3))")
// Function type utilizada no parâmetro, pode ser útil quando se tem micro funções semelhantes, e 
// uma macro função que utiliza as micros.
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(multiplyTwoInts, 5, 7)
// Uma função retorna uma função e a variável a qual recebe o return é definida como function type.
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var value = 3
let function = chooseStepFunction(backward: value > 0)
while value != 0 {
    print("\(value)...")
    value = function(value)
}

// Objective 378
/* Nested functions são funções contidas/declaradas dentro de outras funções, tornando seu escopo reduzido,
contudo podem ser utilizadas ao utilizar Function Type as Return Types assim elas podem ser chamadas no escopo
global e podem ser utilizadas normalmente. */
