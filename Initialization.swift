// Learning Objectives 394 - 398

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The temperature is: \(f.temperature)")


struct Celsius {
    var temperatureCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureCelsius = kelvin - 273.15
    }
}

let boilingWater = Celsius(fromFahrenheit: 212.0)
print(boilingWater.temperatureCelsius)
let freezingWater = Celsius(fromKelvin: 273.15)
print(freezingWater.temperatureCelsius)


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let question = SurveyQuestion(text: "Do you like cake?")
question.ask()
question.response = "Yes, I love cake."
// If you change var text into a let, you can modify it only through init.


// Default Initializers
class ShoppingList {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingList()

struct Size {
    var width = 0.0, height = 0.0
}
let test = Size(width: 2.0, height: 2.0)


// Failable Initializers
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let creature = Animal(species: "Cow")
if let cow = creature {
    print("An animal was initialized: \(cow.species)")
}
let anonCreature = Animal(species: "")
if anonCreature == nil {
    print("The anonymous creature could not be initialized")
}


// Required Initializers
/* Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer */
class SomeClass {
    required init() {
        // code
    }
}

class SomeSubClass: SomeClass {
    required init() {
        // required init
    }
}


// Deinitialization
/* Example: if you create a custom class to open a file and write some data to it, you might need to close the file before the class instance is deallocated. */
