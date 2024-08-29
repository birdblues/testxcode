//: [Previous](@previous)

//: # 제어 흐름
//: ## For-In 루프
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
//Hello, Anna!
//Hello, Alex!
//Hello, Brian!
//Hello, Jack!

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//cats have 4 legs
//spiders have 8 legs
//ants have 6 legs

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//1 times 5 is 5
//2 times 5 is 10
//3 times 5 is 15
//4 times 5 is 20
//5 times 5 is 25

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    print("\(tickMark)")
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("\(tickMark)")
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print("\(tickMark)")
}

//: ## While 루프
//: ### While

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
board

var square = 0
var diceRoll  = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print("\(square)")
}
print("Game Over")

//: ### Repeat - While
//: 다른 언어의 do - while
square = 0
diceRoll = 0
repeat {
    print(square)
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
} while square < finalSquare
print("Game Over")

//: ## 조건 구문
//: if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

let temperatureInCelsius = 25
let weatherAdvice: String
if temperatureInCelsius <= 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)
// Prints "It's not that cold. Wear a T-shirt."

let weatherAdvice2 = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
weatherAdvice2

let freezeWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}
freezeWarning

let freezeWarning2: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}
freezeWarning2

//let weatherAdvice2 = if temperatureInCelsius > 100 {
//    throw TemperatureError.boiling
//} else {
//    "It's a reasonable tempature."
//}

//: ### switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}
message


//: 명시적 Fallthrough
//let otherCharacter: Character = "a"
//switch otherCharacter {
//case "a": // Invalid, the case has an empty body
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}

let otherCharacter: Character = "a"
switch otherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//: ### 간격 일치
let approximateCoun = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCoun {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dezens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
"There are \(naturalCount) \(countedThings)."

//: ### 튜플
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//: ### 값 바인딩
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//: ### where

let yetAnotherPoint = (1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: ### 합성 케이스
let yetSomeCharacter: Character = "e"
switch yetSomeCharacter {
case "a", "e", "i", "o", "u":
    print("\(yetSomeCharacter) is vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(yetSomeCharacter) is a consonant")
default:
    print("\(yetSomeCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//: ## 제어 변경 구문
//: continue, break, fallthrough, return, throw

//: ### continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

//: ### break
//let numberSymbol: Character = "三"
let numberSymbol: Character = "5"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break // 이경우  nil
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

//: ### fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

//: ### 라벨이 있는 구문
//let finalSquare = 25
//var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}

//: 위에서 break 구문을 gameLoop 라벨 없이 사용하면 while 구문을 빠져나오는 것이 아니라 switch 구문을 빠져나옵니다. gameLoop 라벨을 사용하는 것은 제어 구문을 종료하기 위해 명확하도록 만들어 줍니다. 루프의 다음 반복으로 이동하기위해 continue gameLoop 호출할 때 gameLoop 라벨을 사용하는 것은 필요하지 않습니다. 게임에서 오직 하나의 루프만 존재하므로 루프는 continue 구문의 영향을 받습니다. 그러나 continue 구문과 함께 gameLoop 라벨을 사용해도 아무런 문제가 없습니다. 이렇게 하면 break 구문과 일치하며 게임의 로직을 더 명확하게 읽고 이해하는데 도움을 줍니다.

//: ## 이른 종료
func greet(person: [String:String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
//Hello John!
//I hope the weather is nice near you.
greet(person: ["name": "Jane", "location": "Cupertino"])
//Hello Jane!
//I hope the weather is nice in Cupertino.

//: ### 연기된 동작
var score = 1
if score < 10 {
    defer { // scope가 끝날때 항상 실행됨
        print(score)
    }
    score += 5
}

if score < 10 {
    // defer가 여러개인경우 역순으로 실행
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    defer {
        print("The first")
    }
    score += 5
}

//: 사용 가능한 API 확인
if #available(iOS 10, *) {
    print("ios 10")
} else {
    print("not ios 10")
}


@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {
    // Fallback code
}


//: [Next](@next)k
