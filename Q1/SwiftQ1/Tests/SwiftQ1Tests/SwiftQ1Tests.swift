import XCTest

@testable import SwiftQ1

class QueraTests: XCTestCase {
    
    func testDeveloperSalary() {
        let skills = Set<ProgrammingSkill>(arrayLiteral: .objectiveC)
        let developer = Developer(id: 1, name: "E1", hourlySalary: 10, skills: skills)
        
        let startDate = Date(timeIntervalSince1970: 5000)
        let endDate = Date(timeIntervalSince1970: 6000)
        let shift = Shift(start: startDate, end: endDate)
        developer.add(shift: shift)
        var salary = developer.salary()
        
        XCTAssertEqual(salary, 166)
        
        developer.add(shift: shift)
        salary = developer.salary()
        
        XCTAssertEqual(salary, 333)
    }
    
    func testCompanySalarySum() {
        let company = Company(name: "Quera")
        let skills1 = Set<ProgrammingSkill>(arrayLiteral: .objectiveC)
        let developer1 = Developer(id: 1, name: "E1", hourlySalary: 10, skills: skills1)
        
        let skills2 = Set<ProgrammingSkill>(arrayLiteral: .objectiveC, .swift)
        let developer2 = Developer(id: 1, name: "E1", hourlySalary: 12, skills: skills2)
        company.developers = [developer1, developer2]
        
        
        let startDate1 = Date(timeIntervalSince1970: 5000)
        let endDate1 = Date(timeIntervalSince1970: 6000)
        let shift1 = Shift(start: startDate1, end: endDate1)
        developer1.add(shift: shift1)
        developer1.add(shift: shift1)
        
        let startDate2 = Date(timeIntervalSince1970: 5000)
        let endDate2 = Date(timeIntervalSince1970: 6500)
        let shift2 = Shift(start: startDate2, end: endDate2)
        developer2.add(shift: shift2)
        developer2.add(shift: shift2)
        developer2.add(shift: shift2)
        
        let salary = company.salary()
        
        XCTAssertEqual(developer1.salary() + developer2.salary(), salary)
    }
    
//    func testDummy() {
//        let skills = Set<ProgrammingSkill>(arrayLiteral: .objectiveC)
//        let developer = Developer(id: 1, name: "E1", hourlySalary: 10, skills: skills)
//        
//        let startDate = Date(timeIntervalSince1970: 5000)
//        let endDate = Date(timeIntervalSince1970: 6000)
//        let shift1 = Shift(start: startDate, end: endDate)
//        developer.add(shift: shift1)
//        let salary = developer.salary()
//        
//        XCTAssertEqual(salary, 167)
//    }
    
    static var allTests : [(String, (QueraTests) -> () throws -> Void)] {
        return [
            ("testDeveloperSalary", testDeveloperSalary),
//            ("testDummy", testDummy)
            ("testCompanySalarySum", testCompanySalarySum)
        ]
    }
}
