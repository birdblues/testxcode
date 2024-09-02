//: [Previous](@previous)

//: # 에러 처리

//: ## 에러 표현과 던지기
enum VendingMachineError:  Error {
case invalidSelection
case insufficientFunds(coinsNeeded: Int)
case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: ## 에러 처리
//: ### 던지기 함수를 이용한 에러 전파
//: throws

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinDesposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinDesposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinDesposited)
        }
        
        coinDesposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
let favoriteSnaks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnaks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//: ### do catch 사용하여 에러 처리

var vendingMachine = VendingMachine()
vendingMachine.coinDesposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error)")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
   print("Unexpected non-vending-machine-related error: \(error)")
}

//: is 키워드
let someValue: Any = "Hello, World!"

if someValue is String {
    print("someValue는 String 타입입니다.")
} else {
    print("someValue는 String 타입이 아닙니다.")
}

//: ### 에러를 옵셔널 값을 변환
//: 에러를 옵셔널 값으로 변환하여 처리하기 위해 try? 를 사용합니다. try? 표현식을 평가하는 동안 에러가 발생되면 이 표현식의 값은 nil 입니다.

enum NumberError: Error {
    case lessThanZero
    case tooLarge
}

func someThrowingFunction() throws -> Int {
    let number = Int.random(in: -5...10) // -5부터 10 사이의 무작위 숫자 생성

    if number < 0 {
        throw NumberError.lessThanZero
    } else if number > 5 {
        throw NumberError.tooLarge
    }
    
    return number
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//: ### 에러 전파 비활성화
//let validNumberString = "123"
//let invalidNumberString = "ABC"
//
//let number = try! Int(validNumberString)
//let invalidNumber = try! Int(invalidNumberString)
//
//print("변환된 숫자: \(number)")
//

//: ## 에러 타입 지정
//enum StatisticsError: Error {
//    case noRatings
//    case invalidRating(Int)
//}
//
//func summarize(_ ratings: [Int]) throws(StatisticsError) {
//    guard !ratings.isEmpty else { throw StatisticsError.noRatings }
//
//    var counts = [1: 0, 2: 0, 3: 0]
//    for rating in ratings {
//        guard rating > 0 && rating <= 3 else { throw StatisticsError.invalidRating(rating) }
//        counts[rating]! += 1
//    }
//
//    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
//}
//
//let ratings = []
//do throws(StatisticsError) {
//    try summarize(ratings)
//} catch {
//    switch error {
//    case .noRatings:
//        print("No ratings available")
//    case .invalidRating(let rating):
//        print("Invalid rating: \(rating)")
//    }
//}

//: ## 정리작업 지정


//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // Work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}

//: [Next](@next)
