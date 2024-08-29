//: [Previous](@previous)
import Foundation
//: # 클로저
//: 다른 언어의 익명 함수, 람다, 그리고 블럭과 유사

//: ## 클로저 표현식
//: ### 정렬 메서드
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniela"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

//: ### 클로저 표현구
reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in // in은 클로저의 본문 시작을 나타냄.
    return s1 > s2
})
reversedNames

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
reversedNames

//: ### 컨택스트로 타입 추론
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2})
reversedNames
//: 함수나 메서드에 클로저를 인라인 클로저 표현식으로 전달할 때 항상 파라미터 타입과 반환 타입을 유추할 수 있습니다. 결과적으로 클로저가 함수 또는 메서드 인수로 사용될 때 완전한 형태로 인라인 클로저를 작성할 필요가 없습니다.

//: ### 단일 표현 클로저의 암시적 반환
reversedNames = names.sorted(by: {s1, s2 in s1 > s2}) // return이 하나일때 생략 가능
reversedNames

//: 짧은 인수 이름
//: shorthand argument names $0, $1, $2
reversedNames = names.sorted(by: {$0 > $1})
reversedNames

//: 연산자 메서드
reversedNames = names.sorted(by: >)

//: ## 후행 클로저
//: 후행 클로저는 함수의 인수이지만 함수 호출의 소괄호 다음에 작성

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

someFunctionThatTakesAClosure() {
    // closure;s body goes here
}

reversedNames = names.sorted() { $0 > $1 }
reversedNames

reversedNames = names.sorted { $0 > $1 } //() 마저 생략 가능
reversedNames

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings

let strings2 = numbers.map {
    var number = $0
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings2

//func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}

//loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture.")
//}

//: ## 캡처값
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

//: ## 클로저는 참조 타입
//: 위 예제에서 incrementBySeven 과 incrementByTen 은 상수이지만 이러한 상수가 참조하는 클로저는 캡처한 runningTotal 변수를 계속 증가시킬 수 있습니다. 이는 함수와 클로저가 참조 타입 (reference types) 이기 때문
//: 함수 또는 클로저를 상수 또는 변수에 할당할 때마다 실제로 해당 상수 또는 변수를 함수 또는 클로저에 대한 참조 로 설정합니다. 위의 예에서 incrementByTen 은 클로저 자체의 내용이 아니라 상수를 가리키는 클로저의 선택입니다.

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
incrementByTen()
//: 위의 예제는 alsoIncrementByTen 호출은 incrementByTen 호출과 같음을 보여줍니다. 2개 모두 같은 클로저를 참조하기 때문에 둘다 증가하고 같은 러닝 합계를 반환합니다.


//: ## 탈출 클로저
//: 함수에 인수로 클로저를 전달하지만 함수가 반환된 후 호출되는 클로저를 함수를 탈출 (escape) 하다 라고 말합니다. 클로저를 파라미터로 갖는 함수를 선언할 때 이 클로저는 탈출을 허락한다는 의미로 파라미터의 타입 전에 @escaping 을 작성할 수 있습니다. 클로저가 탈출할 수 있는 한가지 방법은 함수 바깥에 정의된 변수에 저장되는 것

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
//func someFunctionWithEscapingClosureE(completionHandler: () -> Void) {
//    completionHandlers.append(completionHandler)
//    // error: converting non-escaping parameter 'completionHandler' to generic parameter 'Element' may allow it to escape
//}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

struct SomeStruct {
    var x = 10
    mutating func doSomeThing() {
//        someFunctionWithEscapingClosure { x = 100 } 
        // Error escaping closure captures mutating 'self' parameter
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
//: 구조체는 값 타입(value type)이기 때문에, 구조체의 인스턴스는 함수가 호출될 때마다 복사됩니다. 구조체의 mutating 메서드는 구조체의 인스턴스를 수정할 수 있지만, 탈출 클로저는 mutating 메서드가 끝난 이후에도 참조를 유지하려고 시도합니다. 탈출 클로저는 비동기 작업을 위해 클로저가 호출된 이후에 실행될 수 있으며, 구조체 인스턴스의 원본을 캡처해야 합니다. 하지만 값 타입인 구조체는 캡처 시점에 클로저가 구조체의 복사본을 캡처하기 때문에, 이후에 원본 구조체가 변경될 경우 클로저가 올바르게 동작하지 않을 수 있습니다. Swift 컴파일러는 이러한 문제를 방지하기 위해 mutating 메서드 내에서 탈출 클로저가 인스턴스의 self를 캡처하는 것을 금지하고 있습니다. 이를 통해 구조체 인스턴스의 불변성을 보장하고, 비동기 작업에서 잠재적인 에러를 방지할 수 있습니다.

//: 탈출 클로저가 필요한 이유는 클로저가 함수의 범위를 벗어나도 실행될 수 있도록 보장하기 위함입니다. 예를 들어, 클로저가 함수의 인스턴스 변수로 저장되거나 비동기 작업의 콜백으로 사용될 때 함수가 반환된 후에도 클로저가 실행되기 때문입니다.
/*
탈출 클로저의 일반적인 사용 사례
비동기 작업:

네트워크 요청, 파일 입출력 작업 등 함수 호출 후 시간이 지나서 완료되는 작업에서 클로저를 콜백으로 사용합니다.
컴플리션 핸들러:

네트워크 라이브러리에서 요청이 완료된 후 응답을 처리하기 위해 클로저를 사용합니다.
캡처된 변수와 메모리 관리:

탈출 클로저는 자신이 캡처한 변수를 강하게 참조(strong reference)할 수 있어, 이를 통해 메모리 누수와 강한 참조 순환(strong reference cycle)이 발생할 수 있습니다. 따라서, 탈출 클로저 내부에서 캡처된 변수는 [weak self]나 [unowned self]를 사용하여 메모리 관리를 명시적으로 처리하는 것이 중요합니다.
*/

//: ## 자동 클로저
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
print("Now serving \(customerProvider())!")
print(customersInLine.count)
customersInLine
func serve(customer cutomerProvider: () -> String) {
    print("Now serving \(cutomerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0)})

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

var customProviders: [() -> String] = []
func collectCustomerProviders(_ cutomerProvider: @autoclosure @escaping () -> String) {
    customProviders.append(cutomerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customProviders.count) closures.")
for customerProvider in customProviders {
    print("Now serving \(customerProvider())!")
}
//Now serving Barry!
//Now serving Daniella!
//: [Next](@next)
