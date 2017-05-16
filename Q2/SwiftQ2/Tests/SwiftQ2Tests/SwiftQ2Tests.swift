import XCTest
@testable import SwiftQ2

class Database: StudentDatabase {
    let coursesCount = 5
    let studentsCount = 30
    
    var courses = [Course]()
    
    var students = [Student]()
    
    init() {
        for i in 0..<coursesCount {
            courses.append(Course(id: i, name: "\(i)"))
        }
        
        
        for i in 0..<studentsCount {
            let course1 = courses[i % coursesCount]
            let course2 = courses[(i + 1) % coursesCount]
            let course3 = courses[(i + 2) % coursesCount]
            
            let grades: [Course: Double?] = [
                course1: nil,
                course2: Double(i % 20),
                course3: Double((2*i) % 20)
            ]
            
            let newStudent = Student(id: i, name: "\(i)", grades: grades)
            students.append(newStudent)
        }
    }
    
    func detail(studentID: Int, completion: (Student?, Error?) -> Void) {
        if studentID % 7 == 0 || studentID >= studentsCount {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(nil, error)
        } else {
            completion(students[studentID], nil)
        }
    }
}

class Q2Tests: XCTestCase {
    func testEducation() {
        let educationSystem = EducationSystem()
        let database = Database()
        educationSystem.set(database: database)
        
        let studentIDs: [Int] = Array(0..<database.studentsCount)
        
        XCTAssertEqual(educationSystem.averageGradeOfStudents(with: studentIDs), 8.7)
    }


    static var allTests = [
        ("testEducation", testEducation),
    ]
}
