//
//  Company.swift
//  Quera
//
//  Created by Behdad Keynejad on 10/2/1396 .
//
//

import Foundation

//extension Employee: SalaryCalculable {
//    func salary() -> Int {
//        return 10000
//    }
//}

extension Developer: SalaryCalculable {
    func salary() -> Int {
        var sumOfSeconds: Double = 0
        for shift in shifts {
            let shiftDuration = shift.end.timeIntervalSince(shift.start)
            sumOfSeconds += shiftDuration
        }
        return Int(sumOfSeconds/60 * hourlySalary * Double(1 + (skills.count)/10))
    }
}

extension Company: SalaryCalculable {
    func salary() -> Int {
        return developers.reduce(0) { $0 + $1.salary() }
    }
}
