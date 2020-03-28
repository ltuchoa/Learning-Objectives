// Learning Objectives 361 - 374 & 399 & 434 & 438

/* Classes have additional capabilities that structures don’t have:
Inheritance.
Type casting.
Deinitializers.
Reference counting.
So they're a more complex data structure than structs, only used if necessary or if it is more appropriate.
*/

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("Some Resolution Width: \(someResolution.width)")
print("Some Video Width: \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1366
print("Some Video Width Update: \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

// Structs and enum are value types
/* A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function. */
var teste = vga
teste.width = 1280
print("vga: \(vga.width)\nteste: \(teste.width)")

// Classes are reference types
/* Rather than a copy, a reference to the same existing instance is used. */
let tenEighty = VideoMode()
tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "480p"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property updated: \(tenEighty.frameRate)")


// Properties
/* Instances of FixedLengthRange have a variable stored property called firstValue and a constant stored property called length. */
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 9

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// Error -> rangeOfFourItems.firstValue = 6

// Lazy Stored Properties
/* A lazy stored property is a property whose initial value is not calculated until the first time it is used. */

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Data data")
manager.data.append("Data data data")
print(manager.importer.filename)

// Computed Properties
/* They provide a getter and an optional setter to retrieve and set other properties and values indirectly. */
var a: String {
    get {
        return "a"
    }
}
// read-only computed property -> doesn't have a set, and you can skip the get declaration, and they're always var

class Alienigena {
    
    let nome: String
    let planeta: String
    var nascimento: Int
    
    var idade: Int {
        get {
            return 2020 - nascimento
        }
        set {
            self.nascimento = 2020 - newValue
        }
    }
    
    init(nome: String, planeta: String, nascimento: Int) {
        self.nome = nome
        self.planeta = planeta
        self.nascimento = nascimento
    }
    
}

let alien = Alienigena(nome: "Kharol", planeta: "Gotico", nascimento: 2000)
alien.idade = 25
print(alien.nascimento)

// Global and Local variables
/* Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context. */

// Memberwise Initialization
/* The structure receives a memberwise initializer even if it has stored properties that don’t have default values */

struct Size {
    var width = 0.0
    var height = 0.0
}

let tbt = Size(width: 2.0, height: 2.0)
let zbt = Size(height: 2.0)
print(zbt.width, zbt.height)
let zbz = Size()
print(zbz.width, zbz.height)


// Type Properties
/* There will only ever be one copy of these properties, no matter how many instances of that type you create.
Type properties are useful for defining values that are universal to all instances of a particular type. */

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
