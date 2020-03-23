// Objectives Learnings 405, 406, 407

protocol OneProtocol {
  mutating func doSomething(name: String) -> String
}

protocol OtherProtocol {
  var name: String { get set }
}

struct All: OneProtocol, OtherProtocol {
  var name: String

  mutating func doSomething(name: String) -> String {
    self.name = name
    return "Olá \(name)"
  }
}

let a: OneProtocol = All(name: "Test")
print(a)

protocol Mammal {
  var numberOfLegs: Int { get }
  var numberOfChilds Int { get set }
}

class Cow: Mammal {
  var numberOfLegs: Int {
    return 4
  }
  var numberOfChilds = 0
}

protocol Container {
  associatedtype Item

  var items: [Item] { get set }

  func append(_ item: Item)
}

class Bag: Container {
  typealias Item = Int

  var items = [Int]()

  func append(_ item: Int) {
    items.append(item)
  }
}
