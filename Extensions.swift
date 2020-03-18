// Objective 369

// Extensions auxiliam a uma melhor organização do projeto, possibilitando criar separadamente os métodos por exemplo.
struct SomeClass {
  var name: String
}

extension SomeClass: Codable {
  func doSomething() { print("1, 2, 3") }
}

let a = SomeClass(name: "Teste")
a.doSomething()

// Possibilita alterar tipos padrões da lingugagem
extension Double {
  var km: Double { return self/1000.0 }
  var m: Double { return self }
  var cm: Double { return self * 100 }
}

var barraDaCalça = 1.4
print(barraDaCalça.cm)

/*
extension Date {
  init(day: Int, month: Int, year: Int) {
    var components = DateComponents()
    components.day = day
    components.month = month
    components.year = year
    let calendar = Calendar.current
    self = calendar.date(from: components) ?? Date()
  }
}

let birthday = Date(day: 21, month: 3, year: 2000)
print(birthday)
*/
