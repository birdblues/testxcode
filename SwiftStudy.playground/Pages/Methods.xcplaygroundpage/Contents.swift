//: [Previous](@previous)

//: # 메서드
//: ## 인스턴스 메서드
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amoount: Int) {
        count += amoount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

//: self 프로퍼티
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//: 인스턴스 메서드 내에서 값 타입 수정
struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) { // mutating은 프로퍼티를 수정할 수 있음
        x += deltaX
        y += deltaY
    }
}
var otherPoint = AnotherPoint(x: 1.0, y: 1.0)
otherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(otherPoint.x), \(otherPoint.y))")

let fixedPoint = AnotherPoint(x: 3.0, y: 2.0)
// fixedPoint.moveBy(x: 2.0, y: 3.0)
// Error

//: ### 변경 메서드 내에서 self 할당
struct TheOtherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = TheOtherPoint(x: x + deltaX, y: y + deltaY) // self에 할당
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()


//: ## 타입 메서드
//: static/class 키워드 사용

class SomeClass {
    class func someTypeMethod() {
        print("this is some type method")
    }
}
SomeClass.someTypeMethod()

//: 타입 메서드 안의 self는 인스턴스를 나타내는 것이 아니라 타입 자체를 참조

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}






//: [Next](@next)
