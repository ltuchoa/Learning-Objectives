// Objectives 347, 348, 349, 354

var letters = Set<Character>()
letters.insert("l")
print(letters)
letters = []
print(letters)

letters.insert("l")
letters.insert("t")
letters.insert("u")
letters.insert("c")
letters.insert("h")
print(letters)
letters.remove("c")
print(letters)
if letters.contains("u") {
  print("Show")
} else { print("Fail") }

for letter in letters {
  print(letter)
}

// sets operations

var numers1 = Set<Int>()
numers1 = [1, 3, 5, 7, 9]
var numers2 = Set<Int>()
numers2 = [0, 2, 4, 6, 8]
print(numers1, numers2)

let prime: Set = [2, 3, 5, 7]

// common between both
let inter = numers1.intersection(numers2)
print(inter)
// all of both
let union = numers1.union(numers2).sorted()
print(union)

// exclusive first
let sub = numers1.subtracting(prime)
print(sub)
// only exclusive from each one
let sym = numers1.symmetricDifference(prime)
print(sym)
