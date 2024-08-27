
print("Hello, world!")
// Prints "Hello, world!"

var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
print(type(of: implicitDouble))

let explicitDouble: Double = 70

// Experiment 명시적 타입이 Float 이고 값이 4 인 상수를 만들어 봅시다.
let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// Experiment 마지막 줄에서 String 으로 변환하는 부분을 삭제해 보십시오. 어떠한 에러가 발생합니까?
//let widthLabel = label + width
/*
 error: A Swift Tour.xcplaygroundpage:23:24: error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'
 let widthLabel = label + width
                  ~~~~~ ^ ~~~~~

 A Swift Tour.xcplaygroundpage:23:24: note: overloads for '+' exist with these partially matching parameter lists: (Int, Int), (String, String)
 let widthLabel = label + width
 */

