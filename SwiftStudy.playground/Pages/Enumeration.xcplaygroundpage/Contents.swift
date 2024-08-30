//: [Previous](@previous)

import Foundation

//: # 열거형
//: ## 열거형 구문
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east


//: ## 스위치 구문에서 열거형 값 일치

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe plase for humans")
}

//: ## 열거형 케이스 반복
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for bevarage in Beverage.allCases {
    print(bevarage)
}
//coffee
//tea
//juice

//: ## 연관된 값
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}
// 모두 추출할 경우
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

//: ## 원시값 raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//: ### 암시적으로 할당된 원시값
enum PlanetInt: Int, CaseIterable {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
for planet in PlanetInt.allCases {
    print("\(planet): \(planet.rawValue), \(planet.hashValue)")
}
//mercury: 1, -5194573745706299289
//venus: 2, 7862713026000426164
//earth: 3, -3661583045147085189
//mars: 4, 4368982802449905495
//jupiter: 5, -2202880401357685455
//saturn: 6, -1080670225184103297
//uranus: 7, -3100704165362784426
//neptune: 8, -4704849392860606894

enum CompassPointString: String, CaseIterable {
    case north, south, east, west
}
for direction in CompassPointString.allCases {
    print("\(direction): \(direction.rawValue)")
}


//: ### 원시값으로 초기화
let possiblePlanet = PlanetInt(rawValue: 7) //rawValue로 접근하면 옵셔널이 반환된다.
print(type(of: possiblePlanet))

let positionToFind = 11
if let somePlanet = PlanetInt(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//: ## 재귀 열거형
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum AnotherArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value) :
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
//: [Next](@next)
