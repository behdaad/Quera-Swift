import Foundation

class Student {
    var id: Int!
    var name: String!
    var grades = [Course: Double?]()
    
    init(id: Int, name: String, grades: [Course: Double?]) {
        self.id = id
        self.name = name
        self.grades = grades
    }
}

class Course {
    var id: Int!
    var name: String!
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

protocol StudentDatabase {
    func detail(studentID: Int, completion: (Student?, Error?) -> Void)
}

protocol EducationProtocol {
    func set(database: StudentDatabase)
    func averageGradeOfStudents(with ids: [Int]) -> Double
}

class EducationSystem {
    var studentDatabase: StudentDatabase!
}
