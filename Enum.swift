// Objectives 360 - 364

enum Compass {
  case north
  case south
  case east
  case west
}

var direction = Compass.west
direction = .north

// 361
switch direction {
  case .north:
    print("Norte")
  case .south:
    print("Sul")
  case .east:
    print("Leste")
  case .west:
    print("Oeste")
  default:
    print("???")
}

// 3622
enum Bebidas: CaseIterable {
  case cafe, suco, agua
}
let qntd = Bebidas.allCases.count
print(qntd)

for bebida in Bebidas.allCases {
  print(bebida)
}

// 363
enum Code {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var product = Code.upc(7, 85909, 52705, 3)
product = .qrCode("RANDOM")

// 364
enum Numbers: Int {
  case one = 1
  case two = 2
  case three = 3
}
// Each raw value must be unique within its enumeration declaration
enum NumbersImplicit: Int {
  case one = 1, two, three, four
}
let teste = NumbersImplicit.three.rawValue
print(teste)
