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
    var developers = [Developer]()
    
    init(name: String) {
        self.name = name
    }
}

enum ProgrammingSkill {
    case swift
    case objectiveC
}

struct Shift {
    var start: Date!
    var end: Date!
}

class Developer {
    var id: Int
    var name: String
    var shifts = [Shift]()
    var hourlySalary: Double
    
    func add(shift: Shift) {
        shifts.append(shift)
    }
    
    var skills: Set<ProgrammingSkill>
    
    init(id: Int, name: String, hourlySalary: Double, skills: Set<ProgrammingSkill>) {
        self.id = id
        self.name = name
        self.hourlySalary = hourlySalary
        self.skills = skills
    }
}

protocol SalaryCalculable {
    func salary() -> Int
}
