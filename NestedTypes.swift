// Learning Objectives 401 & 402

class Employee {
    var dept = Departament()
    
    class Departament {
        var empID = 150
        var empName = "John"
        func getDetails() -> String {
            return "Id: \(self.empID)\nName: \(self.empName)"
        }
    }
}

var employee = Employee()
print(employee.dept.getDetails())



class Student {
    enum StudentTypes {
        case intelligent
        case good
    }
    
    func name() -> StudentTypes {
        return .intelligent
    }
}

class Teacher {
    let student = Student()
    var type: Student.StudentTypes
    
    init() {
        self.type = self.student.name()
    }
}

var result = Student.StudentTypes.good
print(result)
