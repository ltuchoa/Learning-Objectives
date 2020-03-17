// Objective 329

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

var x = 2
var y = 7

let soma = sum(x: x, y: y)
print("Soma de \(x) e \(y): \(soma)")

let subt = sub(x: x, y: y)
print("Subtração de \(x) e \(y): \(subt)")

let multi = mult(x: x, y: y)
print("Multiplicação de \(x) e \(y): \(multi)")

let divi = div(x: x, y: y)
print("Divisão de \(x) e \(y): \(divi)")
