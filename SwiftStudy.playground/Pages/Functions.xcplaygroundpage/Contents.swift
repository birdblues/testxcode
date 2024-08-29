//: [Previous](@previous)

//: # 함수
//: ## 함수의 정의와 호출
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

//: ## 함수 파라미터와 반환값
//: ### 파라미터 없는 함수
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//: ### 여러개 파라미터가 있는 함수
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//: ### 반환값 없는 함수
func anothergreet(person: String) {
    print("Hello, \(person)!")
}
anothergreet(person: "Dave")

//: 엄밀히 말하면 greet(person:) 함수는 반환값을 정의하지 않았지만 여전히 반환값이 있습니다. 반환 타입이 정의되지 않은 함수는 Void 타입의 특별한 값을 반환합니다. 이것은 () 로 쓰여진 빈 튜플입니다.

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

//: ### 여러개의 반환값이 있는 함수
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: ### 옵셔널 튜플 반환 타입
func minMax2(array: [Int]) -> (min:Int, max:Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax2(array: [0, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

//: ### 암시적 반환을 가진 함수
func greeting(for person: String) -> String {
    "Hello, " + person + "!" // 단일 return 함수는 return을 생략 가능
}
print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))

func testFunction() -> Int {
    fatalError("Oh no!")
    // 이 함수는 'Never'를 반환하기 때문에 실제로는 'Int'를 반환하지 않습니다.
}
//: fatalError와 암시적 반환: fatalError는 Never 타입을 반환하며, Swift는 이 경우 암시적 반환이 일어나지 않는다는 것을 인식합니다.

//: ## 함수 인수 라벨과 파라미터 이름
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//: ### 인수 라벨 지정
func someFunction(arguemntLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func greet(person: String, form hometown: String) -> String {
    return "Hello \(person): Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", form: "Cupertino"))

//: ### 인수 라벨 생략
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)

//: ### 파라미터 기본값
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

//: ### 가변 파라미터
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

//: In-Out 파라미터
//: 함수의 인자는 기본적으로 상수. 함수의 인자값 자체를 변경화고 싶다면 inout 사용

func swapTowInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTowInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//swapTowInts(someInt, anotherInt)

//: ## 함수 타입

//(Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
   return a + b
}
//(Int, Int) -> Int
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
   return a * b
}
// () -> Void
func printHelloWorld() {
    print("hello, world")
}

//: ### 함수 타입 사용
var mathFunction: (Int, Int) -> Int = addTwoInts(_:_:)
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int

//: ### 파라미터 타입으로 함수 타입
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
//printMathResult(addTwoInts(_:_:), 3, 5)
printMathResult(addTwoInts, 3, 5)

//: 반환 타입으로 함수 타입

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//: ## 중첩 함수
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
currentValue = -4
let moveToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveToZero(currentValue)
}
print("zero!")
//-4
//-3
//-2
//-1
//zero!

//: [Next](@next)
