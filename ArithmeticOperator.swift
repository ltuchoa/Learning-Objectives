// Objective 329 and 335

func sum (x: Int, y: Int) -> Int{
  return x + y
}

func sub (x: Int, y: Int) -> Int{
  return x - y
}

func mult (x: Int, y: Int) -> Int{
  return x * y
}

func div (x: Int, y: Int) -> Int{
  return x / y
}

func remain (x: Int, y: Int) -> Int {
  return x % y
}

var x = 7
var y = 2

let soma = sum(x: x, y: y)
print("Soma de \(x) e \(y): \(soma)")

let subt = sub(x: x, y: y)
print("Subtração de \(x) e \(y): \(subt)")

let multi = mult(x: x, y: y)
print("Multiplicação de \(x) e \(y): \(multi)")

let divi = div(x: x, y: y)
print("Divisão de \(x) e \(y): \(divi)")

let rem = remain(x: x, y: y)
print("Resto de \(x) e \(y): \(rem)")
