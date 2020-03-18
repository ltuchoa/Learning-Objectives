// Objectives 347, 348, 349

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
