//: [Previous](@previous)
//: # 상속
//: ## 기본 클래스 정의
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//: ## 하위 클래스
class Bicucle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicucle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.description)
class Tandem: Bicucle {
    var currentNumberofPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberofPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//: ## 재정의
//: override
//: ### 상위 클래스 메서드, 프로퍼티, 그리고 서브스크립트 접근
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
// Choo Choo

//: ### 프로퍼티 재정의
//: #### 프로퍼티 getter setter 재정의
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.description)

//: #### 프로퍼티 관찰자 재정의
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//: ## 재정의 방지
//: final 사용 final class 클래스 전체를 final로 지정

//: [Next](@next)
