//: [Previous](@previous)

import Foundation

//: # 구조체와 클래스
//: wift에서 단일 파일로 구조체 또는 클래스를 정의하면 해당 클래스 또는 구조체에 대한 외부 인터페이스가 자동으로 다른 코드에서 사용할 수 있습니다.

//: ## 구조체와 클래스의 비교

/*
 공통점
 
 값을 저장하는 프로퍼티 정의

 기능 제공을 위한 메서드 정의

 서브 스크립트 구문을 사용하여 값에 접근을 제공하는 서브 스크립트 정의

 초기화 상태를 설정하기 위한 초기화 정의

 기본 구현을 넘어 기능적 확장을 위한 확장

 특정 종류의 표준 기능을 제공하는 프로토콜 준수
 
 */

/*
 클래스 추가 기능
 
 상속을 사용하면 한 클래스가 다른 클래스의 특성을 상속할 수 있습니다.

 타입 캐스팅을 사용하면 런타임에 클래스 인스턴스의 타입을 확인하고 해석할 수 있습니다.

 초기화 해제 구문 (Deinitializers) 을 사용하면 클래스의 인스턴스가 할당된 리소스를 해제할 수 있도록 합니다.

 참조 카운팅은 하나 이상의 클래스 인스턴스 참조를 허락합니다.
 */

//: ### 정의 구문
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

//: ### 구조체와 클래스 인스턴스
let someResolution = Resolution()
let someVideoMode = VideoMode()

//: ### 프로퍼티 접근
print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1200
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//: ### 구조체 타입에 대한 멤버별 초기화 구문
let vga = Resolution(width: 640, height: 400)
//: 구조체와 반대로 클래스 인스턴스는 멤버별 초기화를 받지 않습니다.

//: ## 구조체와 열거형은 값 타입

let hd = Resolution(width: 1920, height: 1000)
var cinema = hd // 복사본이 cinema에 할당됨 hd와 cinema는 다른 인스턴스

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixel wide")

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//: ## 클래스는 참조 타입
//: 값 타입과 반대로 참조 타입 (reference types) 은 변수 또는 상수에 할당될 때나 함수로 전달될 때 복사되지 않습니다. 복사본 대신에 존재하는 같은 인스턴스에 대한 참조가 사용됩니다.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//: ### 식별 연산자
//: === 동일 인스턴스 !== 동일하지 않은 인스턴스
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//: 포인터
//: Swift 표준 라이브러리는 포인터와 직접 상호작용이 필요한 경우 사용할 수 있는 포인터와 버퍼 타입을 제공합니다.


//: [Next](@next)
