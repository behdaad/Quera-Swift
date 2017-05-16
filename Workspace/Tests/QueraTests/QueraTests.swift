import XCTest

@testable import Quera

class QueraTests: XCTestCase {
    
    func testDeveloperSalary() {
        let skills = Set<ProgrammingSkill>(arrayLiteral: .objectiveC)
        let developer = Developer(id: 1, name: "E1", hourlySalary: 10, skills: skills)
        
        let startDate = Date(timeIntervalSince1970: 5000)
        let endDate = Date(timeIntervalSince1970: 6000)
        let shift1 = Shift(start: startDate, end: endDate)
        developer.add(shift: shift1)
        let salary = developer.salary()
        
        XCTAssertEqual(salary, 166)
    }
    
    func testDummy() {
        let skills = Set<ProgrammingSkill>(arrayLiteral: .objectiveC)
        let developer = Developer(id: 1, name: "E1", hourlySalary: 10, skills: skills)
        
        let startDate = Date(timeIntervalSince1970: 5000)
        let endDate = Date(timeIntervalSince1970: 6000)
        let shift1 = Shift(start: startDate, end: endDate)
        developer.add(shift: shift1)
        let salary = developer.salary()
        
        XCTAssertEqual(salary, 167)
    }
    
    static var allTests : [(String, (QueraTests) -> () throws -> Void)] {
        return [
            ("testDeveloperSalary", testDeveloperSalary),
            ("testDummy", testDummy)
        ]
    }
}
