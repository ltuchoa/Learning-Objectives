// Objectives 350, 351, 352, 353

var nameOfPlayer = [Int: String]()

nameOfPlayer[10] = "Neymar"
nameOfPlayer = [:]

var airports: [String: String] = ["REC":"Recife", "BEL":"Belém"]
// since its String: String it could be implicit

print("Total of airports = \(airports.count)")

airports["FOR"] = "Fortaleza"

if let oldValue = airports.updateValue("Hellcife", forKey: "REC"){
  print("Old value = \(oldValue)")
}

airports["APL"] = "Apple Airport"
//print(airports)
airports["APL"] = nil // Remove from dictionary
//print(airports)

for (airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}
