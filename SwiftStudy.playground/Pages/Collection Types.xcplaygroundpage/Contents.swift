//: [Previous](@previous)

//: # 콜렉션 타입
//: Array, Set, Dictionary

//: ## 콜렉션의 가변성
let a = [1, 2, 3]
// a.append(4)
// Error
var b = [1, 2, 3]
b.append(4)

//: ## 배열
//: ### 배열타입구문
var c: Array<Int>
c = []
c.append(1)
var d: [Int]
d = []
d.append(1)

//: ### 빈 배열 생성
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// someInts is of type [Int] with 0 items.
someInts.append(3)
someInts = []

//: ### 기본값 내열 생성
var threeDoubles = Array(repeating: 0.0, count: 3)

//: ### 배열을 더해 생성
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//: ### 배열 리터럴로 생성
var shoppingList: [String] = ["Eggs", "Milk"]

var simpleShoppingList = ["Eggs", "Milk"]

//: ### 배열 접근과 수정
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"
shoppingList

// shoppingList[shoppingList.count] = "Salt"
// Error

shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
shoppingList

//: ### 배열 반복
for item in shoppingList {
    print(item)
}
//Six eggs
//Milk
//Flour
//Baking Powder
//Chocolate Spread
//Cheese
//Butter

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//Item 1: Six eggs
//Item 2: Milk
//Item 3: Flour
//Item 4: Baking Powder
//Item 5: Chocolate Spread
//Item 6: Cheese
//Item 7: Butter

//: ## 집합
//: ### 집합 타입을 위한 해쉬 값
//: set에 저장하기 위해서는 반드시 hashable이어야 함. Swift의 모든 기본 타입 (String, Int, Double, 그리고 Bool)은 기본적으로 hashable 이고 집합의 값 타입 또는 딕셔너리의 키 타입으로 사용할 수 있습니다. 연관된 값이 없는 열거형 (Enumeration) 케이스 값 (열거형 (Enumerations))은 기본적으로 hashable 입니다.

//: ### 집합 타입 구문
//: ### 빈 집합 생성과 초기화
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters
letters = []

//: ### 배열 리터럴로 집합 생성
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var anotherFavoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

//: ### 집합 접근과 수정
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

favoriteGenres.insert("Jazz")
favoriteGenres

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else { // nil
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//: 집합 반복
for genre in favoriteGenres {
    print("\(genre)")
}
//Hip hop
//Classical
//Jazz

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
//Classical
//Hip hop
//Jazz

//: ## 집합 연산 수행
//: ### 기본 집합 연산

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//: ### 집합 멤버십과 동등성
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

//: ## 딕셔너리
//: ### 딕셔너리 타입 짧은 구문
//: 딕셔너리 Key 타입은 집합의 값 타입과 같이 반드시 Hashable 프로토콜을 준수해야 합니다.
//: ### 빈 딕셔너리 생성
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers
namesOfIntegers = [:]

//: ### 딕셔너리 리터럴로 딕셔너리 생성
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var simpleAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: ### 딕셔너리 접근과 수정
print("The airports dictionary contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}
airports

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
airports

airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports

//: ### 딕셔너리 반복
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//LHR: London Heathrow
//YYZ: Toronto Pearson

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//Airport code: YYZ
//Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
//Airport name: Toronto Pearson
//Airport name: London Heathrow

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)





//: [Next](@next)
