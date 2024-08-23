//:# A Swift Tour
//:[Link](https://bbiguduk.gitbook.io/swift/welcome-to-swift/swift-a-swift-tour)

print("Hello, world!")
// Prints "Hello, world!"


//:## 간단한 값 (Simple Values)
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

print(explicitDouble)

// 명시적 타입이 Float 이고 값이 4 인 상수
let explicitFloat: Float = 4
print(type(of: explicitFloat))
print(explicitFloat)

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// 마지막 줄에서 String 으로 변환하는 부분을 삭제해 보십시오. 어떠한 에러가 발생합니까?
// let error = label + width

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """

print(quotation)

// \() 을 사용하여 문자열에 부동 소수점 (floating-point) 계산을 포함하고 인사말에 누군가의 이름을 포함해 보십시오.
let floating = 1.3
let floatingCount = "\(floating) + 10 = \(floating + 10)"
print(floatingCount)
let name = "bird"
let greeting = "Hello \(name)"
print(greeting)

var fruits = ["딸기", "라임", "오랜지"]
fruits[1] = "포도"


var occupations = [
    "나":"대장",
    "너":"쫄다구",
]
occupations["다른넘"] = "개미"

print(occupations)
