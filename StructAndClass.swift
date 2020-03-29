// Learning Objectives 361 - 374 & 399 & 434 & 438-440

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
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

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


// Methods

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}
let counter = Counter()
print(counter.count)
counter.increment()
counter.increment(by: 3)
print(counter.count)
counter.reset()

// Self Property
struct Point {
    var x = 0.0
    var y = 0.0
    func isRightOf(x: Double) -> Bool {
        return self.x > x //self.x refers to the var x of the class, and x refers to the parameter
    }
}
let point = Point(x: 4.0, y: 5.0)
if point.isRightOf(x: 1.0) {
    print("This point is to the right")
}

// Mutating Func
/* Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods. */

struct NewPoint {
    var x = 0.0
    var y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var newPoint = NewPoint(x: 1.0, y: 1.0)
newPoint.moveBy(x: 2.5, y: 4.0)
print("New Values: (\(newPoint.x), \(newPoint.y))")

// Type Methods
/* By using class or static in a func or variable, you make it global to all instances, so if you change it in one instance it'll change to every other.*/
class AnotherClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
AnotherClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
