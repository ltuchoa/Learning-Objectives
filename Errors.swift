// Learning Objectives 366, 367, 368, 246

enum VendingMachineError: Error {
  case invalidSelection
  case insufficientFunds(coins: Int)
  case outOfStock
}

struct Item {
  var price: Int
  var count: Int
}

class VendingMachine {
  var inventory = [
    "Candy Bar": Item(price: 12, count: 7),
    "Chips": Item(price: 10, count: 4),
    "Chocolate": Item(price: 7, count: 9)
  ]
  var coinsDeposited = 0

  func vend(itemNamed name: String) throws {
    guard let item = inventory[name] else {
      throw VendingMachineError.invalidSelection
    }

    guard item.count > 0 else {
      throw VendingMachineError.outOfStock
    }

    guard item.price <= coinsDeposited else {
      throw VendingMachineError.insufficientFunds(coins: item.price)
    }

    coinsDeposited -= item.price

    var newItem = item
    newItem.count -= 1
    inventory[name] = newItem

    print("Dispensing \(name)")

  }
}

let machine = VendingMachine()

machine.coinsDeposited = 40

do {
  try machine.vend(itemNamed: "Chocolate")
} catch {
  print("Deu ruim")
}

print(machine.coinsDeposited)

let favoriteSnacks = [
  "Alice": "Chips",
  "Bob": "Licorice",
  "Eve": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
  let snackName = favoriteSnacks[person] ?? "Candy Bar"
  try vendingMachine.vend(itemNamed: snackName)
}

do {
  print("Tentando comprar Snack...")
  try buyFavoriteSnack(person: "Bob", vendingMachine: machine)
  print("Comprou!")
} catch {
  print(error)
}

var newMachine = VendingMachine()
newMachine.coinsDeposited = 8
do {
  try buyFavoriteSnack(person: "Alice", vendingMachine: newMachine)
  print("Comprou!")
} catch VendingMachineError.invalidSelection {
  print("Invalid Selection!")
} catch VendingMachineError.outOfStock {
  print("Out of Stock!")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
  print("Insufficient Funds. Price: \(coinsNeeded)")
} catch {
  print("Deu ruim! \(error)")
}
