// Learning Objectives 381 - 387

func swapTwoValues<T>(_ a: inout T, _ b: inout T) { // T is a placeholder/Type Parameter and a & b must be the same type
    let tempA = a
    a = b
    b = tempA
}

var a = "A"
var b = "B"
print(a, b)
swapTwoValues(&a, &b)
print(a, b)

// Generic Types = classes, structures and enumerations
struct Stack<Element> { //Element is a type parameter
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfThings = Stack<String>()
stackOfThings.push("uno")
stackOfThings.push("two")
stackOfThings.push("três")
print(stackOfThings.pop())

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfThings.topItem {
    print("Top item is \(topItem)")
}

// Type constraints specify that a type parameter must be inherit from a specific class, or conform to a particular
// protocol or protocol composition.
class SomeClass {}
protocol SomeProtocol {}

func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // something
}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dogs", "llama"]
if let foundIndex = findIndex(of: "llama", in: strings) {
    print("The index of llama is:", foundIndex)
}

// Associated type gives a placeholder name to a type that is used as part of the protocol
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct newStack<Element>: Container {
    // original
    typealias Item = Element
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var s = newStack<String>()
s.append("Teste")
s.append("NewTest")
s.append("Testando")
print(s.count)


func allItemsMatch<C1: Container, C2: Container> (_ someC: C1, _ anotherC: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    
    if someC.count != anotherC.count {
        return false
    }
    
    for i in 0..<someC.count {
        if someC[i] != anotherC[i] {
            return false
        }
    }
    return true
}

var stackOfStrings = newStack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
var arrayOfStrings = newStack<String>()
arrayOfStrings.push("uno")
arrayOfStrings.push("dos")
arrayOfStrings.push("tres")

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match!")
} else {
    print("Not all items match 😢")
}


extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
