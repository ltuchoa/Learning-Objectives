// Objectives 343, 344, 345, 346

// create empty array
var array = [Int]()

// access and modify, iterate over an array
var places = [String]()

if places.isEmpty {print("Empty")} else {print(places)}

places.append("Recife")
places.append("Belém")
places += ["Fortaleza", "Gramado"]

var first = places[0]
print(first)

places[0] = "Guaramiranga"
print(places)

for place in places {
  print("Place: \(place)")
}

for (i, place) in places.enumerated() {
  print("Place \(i+1): \(place)")
}
