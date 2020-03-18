// Objective 328

var x = 1
var y = 5

x += y
print("Novo valor de x: \(x)")
repeat { 
  print("\(x) += \(y) ") 
  x += y
} while(x < 51)
