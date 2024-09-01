//: [Previous](@previous)
//: # 서브스크립트
//: someArray[index] someDictionary[key]

//: ## 서브스크립트 구문
/*
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}
*/

/*
 subscript(index: Int) -> Int {
     // Return an appropriate subscript value here.
 }
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//: ## 서브스크립트 사용
var numberOfLegs = ["spider": 8, "ant": 6, "cat":4]
numberOfLegs["bird"] = 2

//: ## 스브스크립트 옵션
//: 서브스크립트 오버로딩

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
matrix

// let someValue = matrix[2, 2]
// Assertion failed: Index out of range

//: ## 타입 서브스크립트
// static, class 사용
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

//: [Next](@next)
