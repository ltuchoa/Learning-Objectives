// Learning Objectives 388 - 393 & 438

// global class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

// subclass of the global class
class Bicycle: Vehicle {
    var hasBasket = false
}

let bike = Bicycle()
bike.hasBasket = true
bike.currentSpeed = 10.0
print("Bicycle: \(bike.description)")

// subclass of the subclass
class Tandem: Bicycle {
    var currentPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = false
tandem.currentPassengers = 3
tandem.currentSpeed = 7.5
print("Tandem: \(tandem.description)")

// override functions
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// override variables and call original by "super."
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 3
print("Car: \(car.description)")

// Property Observers -> willSet (before changes) and didSet (after changes)
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 45.0
print("Automatic Car: \(automatic.description)")


// Preventing Overrides
/* You can prevent a method, property, or subscript from being overridden by marking it as final.
 So in the class Car the variable description is override, if description was marked as final in the class Vehicle it
 wouldn't be possible to override. */

// Check for Type
let car2 = Car()
let vehicles = [car, bike, car2]

var bikeCount = 0
var carCount = 0

for vehicle in vehicles {
    if vehicle is Car {
        carCount += 1
    } else if vehicle is Bicycle {
        bikeCount += 1
    }
}
print("Bikes: \(bikeCount)\nCars: \(carCount)")


// Downcasting
/* The conditional form, as?, returns an optional value of the type you are trying to downcast to. The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.
    Kind of a safe mode to check type using as?.
 */

for vehicle in vehicles {
    if let carrin = vehicle as? Car {
        print("Carrin: " + carrin.description)
    } else if let bikin = vehicle as? Bicycle {
        print("Bikin: " + bikin.description)
    }
}
