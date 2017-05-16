//
//  Answer.swift
//  Q2
//
//  Created by Behdad Keynejad on 25/2/1396 .
//
//

import Foundation

extension Course: Hashable {
    var hashValue: Int {
        return id
    }
}

extension Course: Equatable {
    static func ==(lhs: Course, rhs: Course) -> Bool {
        return lhs.id == rhs.id
    }
}

extension EducationSystem: EducationProtocol {
    func set(database: StudentDatabase) {
        self.studentDatabase = database
    }
    
    func averageGradeOfStudents(with ids: [Int]) -> Double {
        var sum: Double = 0
        var count = 0
        
        var students = [Student]()
        for id in ids {
            studentDatabase.detail(studentID: id) { student, error in
                if error == nil {
                    students.append(student!)
                }
            }
        }
        
        for student in students {
            for (_, grade) in student.grades {
                if let grade = grade {
                    count += 1
                    sum += grade
                }
            }
        }
        
        return sum / Double(count)
    }
}
