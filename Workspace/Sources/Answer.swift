//
//  Company.swift
//  Quera
//
//  Created by Behdad Keynejad on 10/2/1396 .
//
//

import Foundation

//extension Employee: SalaryCalculatable {
//    func salary() -> Double {
//        var sumOfHours: Double = 0
//        for shift in shifts {
//            let shiftDuration = shift.end.timeIntervalSince(shift.start)
//            sumOfHours += shiftDuration
//        }
//        return sumOfHours * hourlySalary
//    }
//}

extension Developer: SalaryCalculatable {
    func salary() -> Int {
        var sumOfSeconds: Double = 0
        for shift in shifts {
            let shiftDuration = shift.end.timeIntervalSince(shift.start)
            sumOfSeconds += shiftDuration
        }
        return Int(sumOfSeconds/60 * hourlySalary * Double(1 + (skills.count)/10))
    }
}
