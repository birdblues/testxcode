//: [Previous](@previous)

//: # 기본

//: Int, Double, Bool, String, Array, Set, Dictionary, tuple, Optional

//: ## 상수와 변수
//: ### 상수와 변수 선언
//let maximumNumberOfLoginAttempts = 10
var currentLoginAttemps  = 0


var environment = "development"
let maximumNumberOfLoginAttempts: Int
// maximumNumberOfLoginAttempts는 아직 값이 설정되지 않음

if environment == "development" {
    maximumNumberOfLoginAttempts = 100
} else {
    maximumNumberOfLoginAttempts = 10
}

// 여러개의 상수또는 변수는 ,로 구분할 수 있음
var x = 0.0, y = 0.0, z = 0.0

//: ### 타입 명시
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

//: ### 상수와 변수의 이름
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"


var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"


let languageName = "Swift"
//languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.


//: ### 상수와 변수 출력
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"

//: ## 주석

// This is a comment.
/* This is also a comment
but is written over multiple lines. */
/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */


//: ## 세미콜론
let cat = "🐱"; print(cat)
// Prints "🐱"


//: ## 정수
// Int8, Int16, Int32, Int64, UInt8, ...
//: ### 정수 범위
let minValue = UInt8.min
let maxValue = UInt8.max

//: ### Int
Int.min
Int.max
Int32.min
Int32.max
Int64.min
Int64.max


//: ### UInt

UInt.min
UInt.max
UInt8.min
UInt8.max
UInt16.min
UInt16.max
UInt32.min
UInt32.max
UInt64.min
UInt64.max


//: ## 부동 소수점 숫자
// Double, Float

//: ## 타입 세이프티와 타입 추론

let meaningOfLife = 42
print(type(of: meaningOfLife))

let pi = 3.14159
print(type(of: pi))

let anotherPi = 3 + 0.14159
print(type(of: anotherPi))

//: ## 숫자 리터럴

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 // 0x0.3p0 = 3 * (1/16) * 2^0 = 0.1875

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: ## 숫자 타입 변환
//: ### 정수 변환
/*
let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error
*/

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print(type(of: twoThousandAndOne))
//let anotherTwoThousandOne = twoThousand + one
// error

//: ### 정수와 부동 소수점 변환
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
// pi2 equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int 소수점 이하 버림


//: ## 타입 별칭
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
print(type(of: maxAmplitudeFound))

//: ## 부울
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."

/*
let i = 1
if i {
    // this example will not compile, and will report an error
}
*/

let i = 1
if i == 1 {
    // this example will compile successfully
}

//: ## 튜플
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


//: ## 옵셔널
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// The type of convertedNumber is "optional Int" (Int?)
print(type(of: convertedNumber))

//: ### nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? //기본값이 없이 옵셔널 변수를 정의하면 이 변수는 자동적으로 nil 로 설정

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//: ### 옵셔널 바인딩
// if, guard, while

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
    print(type(of: actualNumber))
} else {
    print("The string \(possibleNumber) could not be to an integer")
}
//: Int(possibleNumber) 에 의해 반환된 옵셔널 Int 에 값이 포함되어 있으면 actualNumber 라는 새로운 상수에 옵셔널에 포함된 값을 설정합니다.변환에 성공하면 actualNumber 상수는 if 구문에 첫번째 중괄호 내에서 사용할 수 있습니다. 옵셔널에서 포함된 값으로 초기화되었고 적절한 옵셔널이 아닌 타입입니다. 이런 경우에 possibleNumber 의 타입은 Int? 이므로 actualNumber 의 타입은 Int 입니다.

let myNumber = Int(possibleNumber)
print(type(of: myNumber))
if let myNumber = myNumber {
    print("My number is \(myNumber)")
    print(type(of: myNumber)) //상수임
}

//언레핑
if let myNumber {
    print("My number is \(myNumber)")
    print(type(of: myNumber)) //상수임
}
print(type(of: myNumber)) //옵셔널

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//: ### 대체값 제공
//let name: String? = nil
let name: String? = "John Appleseed"
let greeting = "Hello, " + ( name ?? "friend") + "!"
greeting

//: ### 강제 언래핑

let number = convertedNumber!
guard let number = convertedNumber else {
    fatalError("The number was invalid")
}
number

//: 암시적으로 언래핑된 옵셔널

let possibleString: String? = "An optional string"
let forcedString: String = possibleString! // 명시적으로 언랩핑
print(type(of: forcedString))

let assumedString: String! = "An implicitly unwrapped optional string"
//let assumedString: String! = nil
let implicitString: String = assumedString //암시적으로 언랩핑
let optionalString = assumedString
print(type(of: implicitString))
print(type(of: optionalString))

if assumedString != nil {
    print(assumedString!)
   print(type(of: assumedString))
}

if let definiteString = assumedString {
    print(definiteString)
    print(type(of: definiteString))
}

if let assumedString {
    print(assumedString)
    print(type(of: assumedString))
}
print(type(of: assumedString))

//: ## 에러 처리

func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//func makeASandwich() throws {
//    // ...
//}
//
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

//: ## 역설과 전제조건
//: ### 역설을 통한 디버깅

let age = -3
//assert(age>=0, "A person's age can't be less than zero.")
//Assertion failed: A person's age can't be less than zero.
//assert(age>=0)
//Assertion failed
//if age > 10 {
//    print("You can ride the roller-coaster or the ferris wheel.")
//} else if age >= 0 {
//    print("You can ride the ferris wheel.")
//} else {
//    assertionFailure("A person's age can't be less than zero.")
//    // Fatal error: A person's age can't be less than zero.
//}

//: ### 강제 전제조건
let index = -1
//precondition(index > 0, "Index must be greater than zero")
// Fatal error: A person's age can't be less than zero.

//: assert와 precondition의 중요한 차이점은 릴리즈에서 동작여부이다.



//: [Next](@next)
