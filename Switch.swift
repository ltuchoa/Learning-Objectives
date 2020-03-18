// Objective 355, 357, 358

// Compound cases
//let caractere: Character = "i"
let caractere = "k"

switch caractere {
  case "a", "e", "i", "o", "u":
    print("\(caractere) é uma vogal")
  default:
    print("\(caractere) não é uma vogal")
}

// Value Binding -> temporary constants or variables
//let coordinate = (7, 0)
let coordinate = (7, 2)
switch coordinate {
  case (let x, 0):
    print("Está no eixo x: \(x), 0")
  case (0, let y):
    print("Está no eixo y: \(y), 0")
  case let (x, y):
    print("Está em algum lugar: (\(x), \(y))")
}

// Where clause
//let coordenada = (2, 2)
let coordenada = (7, 2)
switch coordenada {
  case let (x, y) where x == y:
    print("x == y")
  case let (x, y) where x == -y:
    print("x == -y")
  case let (x, y):
    print("Somewhere (\(x), \(y))")
}
