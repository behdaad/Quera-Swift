import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var startIndex = 0
var endIndex = input.count - 1

while startIndex <= endIndex {
    print(input[startIndex], terminator: " ")
    
    if startIndex != endIndex {
        print(input[endIndex], terminator: " ")
    }
    
    startIndex += 1
    endIndex -= 1
}

print()
