//: [Previous](@previous)

import Foundation
//: # 프로퍼티
//: ## 저장된 프로퍼티
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//: ### 상수 고조체 인스턴스의 저장된 프로퍼티

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

//: ### 지연 저장된 프로퍼티
//: lazy 사용

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager
print(manager.importer.filename)
manager

//: lazy 수식어가 붙어 있으므로 importer 프로퍼티의 DataImporter 인스턴스는 filename 프로퍼티를 조회할 때처럼 importer 프로퍼티에 처음 접근될 때 생성됩니다

//: ### 저장된 프로퍼티와 인스턴스 변수

//: ## 계산된 프로퍼티
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


//: ### 짧은 Setter 선언

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set { // newValue가 기본이름
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: ### 짧은 Getter 선언
struct CompactRect {
    var origin = Point()
    var size  = Size()
    var center: Point {
        get { // return이 하나일때 생략 가능
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: ### 읽기전용 계산된 프로퍼티
//: setter가 없고 getter만 있는 계산된 프로퍼티는 읽기전용 계산된 프로퍼티
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double { //get 조차 필요 없음
//        return width * height * depth
        width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//: ## 프로퍼티 관찰자
//: willSet, didSet

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
//About to set totalSteps to 200
//Added 200 steps
stepCounter.totalSteps = 360
//About to set totalSteps to 360
//Added 160 steps

//: ## 프로퍼티 래퍼
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { number }
        set { number = min(newValue,  12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

var rectangle = SmallRectangle2()
print(rectangle.height)
rectangle.height = 10
print(rectangle.height)
rectangle.height = 24
print(rectangle.height)

//: ### 레핑된 프로퍼티를 위한 초기값 설정
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
//    init(maximum: Int) {
//        self.maximum = maximum
//        number = 0
//    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectagle = ZeroRectangle()
print(zeroRectagle.height, zeroRectagle.width)

struct UnitRectangle {
    @SmallNumber var height: Int = 1 // init(wrappedValue:)
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}
var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1 //init(wrappedValue: 1)
    @SmallNumber(maximum: 9) var width: Int = 2 // init(wrappedValue: 2, maximum: 9)
}
var mixedRectangle = MixedRectangle()
print(mixedRectangle.height, mixedRectangle.width)
mixedRectangle.height = 20
print(mixedRectangle.height)

//: ### 프로퍼티 래퍼에서 값 투영
@propertyWrapper
struct AnotherSmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool //
    
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @AnotherSmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.someNumber, someStructure.$someNumber)
someStructure.someNumber = 50
print(someStructure.someNumber, someStructure.$someNumber)
// someStructure.$someNumber = false

enum AnotherSize {
    case small, large
}

struct SizeRectangle {
    @AnotherSmallNumber var height: Int
    @AnotherSmallNumber var width: Int
    
    mutating func resize(to size: AnotherSize) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 200
        }
        return $height || $width
    }
}
var sizeRectangle = SizeRectangle()
print(sizeRectangle.height, sizeRectangle.width)

print(sizeRectangle.resize(to: .large))
print(sizeRectangle.height, sizeRectangle.width)

//: ## 전역과 지역 변수
func someFunction() {
    @SmallNumber var myNumber: Int = 0
    print(myNumber)

    myNumber = 10
    print(myNumber)

    myNumber = 24
    print(myNumber)
}
someFunction()

//: ## 타입 프로퍼티
//: 다른 언어의 static 상수 변수 프로퍼티

//: ### 타입 프로퍼티 구문
struct SomeStaticStructure {
    static var storeTypeProperty = "Some value"
    static var computedTypeProperty: Int { // 읽기 전용 getter
        return 1
    }
}
// 열거형에서도 타입 속성을 정의할 수 있습니다. 열거형은 인스턴스를 생성할 수 없으므로 타입 속성만을 가질 수 있습니다.
enum SomeStaticEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int { // 읽기 전용 getter
        return 6
    }
}
class SomeStaticClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int { // 읽기 전용 getter
        return  27
    }
    class var overrideableComputedTypeProperty: Int { // class 키워드를 사용한 계산된 타입 속성
        return 107
    }
}

//: ### 타입 프로퍼티 조회와 설정
print(SomeStaticStructure.storeTypeProperty)
SomeStaticStructure.storeTypeProperty = "Another value"
print(SomeStaticStructure.storeTypeProperty)
print(SomeStaticEnumeration.computedTypeProperty)
print(SomeStaticClass.computedTypeProperty)
print(SomeStaticClass.overrideableComputedTypeProperty)

class ParentClass {
    static var storeTypeProperty = 100
    class var overridableComputedTypeProperty: Int {
        return 100
    }
}

class ChildClass: ParentClass {
    override class var overridableComputedTypeProperty: Int {
        return 200
    }
}

// 타입 속성에 접근
print(ParentClass.storeTypeProperty)
print(ParentClass.overridableComputedTypeProperty) // 100
print(ChildClass.storeTypeProperty)  // 100
print(ChildClass.overridableComputedTypeProperty)  // 200
ChildClass.storeTypeProperty = 200
print(ParentClass.storeTypeProperty) // 200
print(ChildClass.storeTypeProperty) // 200

//:

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)


//: [Next](@next)
