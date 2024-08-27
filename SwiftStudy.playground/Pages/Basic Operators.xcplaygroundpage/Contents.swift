//: [Previous](@previous)

//: # 기본 연산자
//: ## 술어
//: 단항 연산자, 이항 연산자, 삼항 연산자

//: ## 대입 연산자
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)
(x, y)

//if x = y {
//   // This is not valid, because x = y does not return a value.
//}

//: ## 산술 연산자

1 + 2
5 - 3
2 * 3
10.0 / 2.5

//오버플로우 연산자
// a &+ b

"hello, " + "world"

9 % 4 // 9 = (4 x 2) + 1
// a = (b x some multiplier) + remainder

-9 % 4 // -9 = (4 x -2) + -1

//b 에 음수는 무시됩니다. 이것은 a % b 와 a % -b 는 항상 같은 결과를 얻는다는 의미

//: ## 단항 뺄셈 연산자

let three = 3
let minusThree = -three
let plusThree = -minusThree

//: ## 단항 덧셈 연산자
let minusSix = -6
let alsoMinusSix = +minusSix
//단항 덧셈 연산자는 실제로 아무런 동작을 하지 않지만 음수에 단항 뺄셈 연산자를 사용할 때 양수에 대칭을 위해 사용할 수 있습니다.

//: ## 복합 대입 연산자
var ab = 1
ab += 2

let bb = ab += 2
print(bb)

//: ## 비교 연산자

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hellow, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

("blue", -1) < ("purple", -2)
//("blue", false) < ("purple", true)

//: ## 삼항 조건 연산자
//: question ? answer1 : answer2

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//: ## Nil-결합 연산자
//: a ?? b / a!= nil ? a!: b

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"

//: ## 범위 연산자
//: ### 닫힌 범위 연산자
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

//: ### 반열림 범위 연산자
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

//: ### 단방향 범위 연산자

for name in names[2...] {
    print(name)
}
//Brian
//Jack

for name in names[...2] {
    print(name)
}
//Anna
//Alex
//Brian

for name in names[..<2] {
    print(name)
}
//Anna
//Alex

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)


//: ## 논리 연산자
//: ### 논리적 NOT 연산자
let allowdEntry = false
if !allowdEntry {
    print("ACCESS DENIED")
}

//: ### 논리적 AND 연산자
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ### 논리적 OR 연산자
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: 논리적 연산자 결합
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ### 명시적 소괄호
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: Swift 논리적 연산자 && 와 || 은 왼쪽 우선결합 (left-associative) 입니다. 그 의미는 여러개의 논리적 연산자로 이루어진 복합 표현식은 가장 왼쪽부터 판단한다는 뜻입니다.


//: [Next](@next)
