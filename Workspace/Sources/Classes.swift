//
//  Employee.swift
//  Quera
//
//  Created by Behdad Keynejad on 10/2/1396 .
//
//

import Foundation

class Company {
    var name: String!
    var employees = [Employee]()
}

enum ProgrammingSkill {
    case swift
    case objectiveC
}

struct Shift {
    var start: Date!
    var end: Date!
}

class Employee {
    var id: Int
    var name: String
    var shifts = [Shift]()
    var hourlySalary: Double
    
    func add(shift: Shift) {
        shifts.append(shift)
    }
    
    init(id: Int, name: String, hourlySalary: Double) {
        self.id = id
        self.name = name
        self.hourlySalary = hourlySalary
    }
}

class Developer: Employee {
    var skills: Set<ProgrammingSkill>
    
    init(id: Int, name: String, hourlySalary: Double, skills: Set<ProgrammingSkill>) {
        self.skills = skills
        super.init(id: id, name: name, hourlySalary: hourlySalary)
    }
}

protocol SalaryCalculatable {
    func salary() -> Int
}
