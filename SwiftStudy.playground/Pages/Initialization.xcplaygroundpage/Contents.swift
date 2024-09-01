//: [Previous](@previous)

//: # 초기화
//:## 저장된 프로퍼티에 초기값 설정
//: 클래스와 구조체는 인스턴스가 생성될 때까지 모든 저장된 프로퍼티에 적절한 초기값이 반드시 설정된어야 한다.
//: ### 초기화 구문
/*
 init() {
    // peform some initialization here
 }
 */

struct Fahrenheit {
    var temprature: Double
    init() {
        temprature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temprature) Fahrenheit")

//: ### 기본 프로퍼티 값
struct SimpleFahrenheit {
    var temperature = 32.0
}

//: ## 초기화 구문 사용자화
//: ### 초기화 파라미터
struct Celsius {
    var temperatureInCelsius: Double
    init(fromeFahrenheit fahrenheit: Double) {
        self.temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        self.temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromeFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

//: ### 파라미터 이름과 인수 라벨
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0, 1.0, 0.0)
//Error argument lables are required

//: ### 인수 라벨 없는 초기화 구문 파라미터
struct AnotherCelsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit * 32.0) / 1.8
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = AnotherCelsius(37.0)
                 

//: ### 옵셔널 프로퍼터 타입
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

//: ### 초기화 동안 프로퍼티 상수 할당
class AnotherSurveyQuestion {
    let text: String //  상수로 설정하여 초기화 후 변경을 막음
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = AnotherSurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//: ## 기본 초기화 구문
class ShoppingListItem {
    var name: String? //  기본값 nil로 초기화
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//: ### 구조체 타입에 대한 멤버별 초기화 구문
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
print(twoByTwo.width, twoByTwo.height)

let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)

//: ## 값 타입을 위한 초기화 구문 위임
struct AnotherSize {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size  = AnotherSize()
    init() {}
    init(origin: Point, size: AnotherSize) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: AnotherSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size) // 위임
    }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: AnotherSize(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: AnotherSize(width: 3.0, height: 3.0))

//: ## 클래스 상속과 초기화
//: 모든 클래스의 저장된 프로퍼티는 초기화 중 반드시 초기값이 할당되어야 한다.
//: ### 지정된 초기화와 편의 초기화
//: ### 지정된 초기화와 편의 초기화 구문
//: ### 클래스 타입에 대한 초기화 구문 위임
//: ### 2단계 초기화
//: ### 초기화 구문 상속과 재정의
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

//: super.init() 생략 조건
//: 1. 하위 클래스의 모든 저장된 프로퍼티가 초기화되었을 때. 2. 상위 클래스가 인수가 없는 지정된 초기화 구문을 가지고 있을 때. 3. 상위 클래스의 지정된 초기화 구문이 동기적(synchronous)일 때.

class Parent {
    var value: Int = 0

    // 상위 클래스의 지정된 초기화 구문
    init() {
        self.value = 1
        print("Parent initialized")
    }
}

class Child: Parent {
    var childValue: String = "test"

    // 하위 클래스의 지정된 초기화 구문
    override init() {
//        super.init()
//        self.value = 2
        self.childValue = "tee"
        // super.init()을 호출하지 않아도 된다. 암시적으로 불림
        print("Child initialized with childValue: \(childValue)")
    }
}
let child = Child()

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        //super.init() 암시적으로 불림
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//: ### 자동 초기화 구문 상속


//: 상위 클래스의 초기화 구문이 비동기적이라면 await super.init()


//: ### 지정된 초기화 구문과 편의 초기화 구문 동작
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class AShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " v" : " x"
        return output
    }
}

var breakfastList = [
    AShoppingListItem(),
    AShoppingListItem(name: "Bacon"),
    AShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//: ## 실패 가능한 초기화 구문



//: [Next](@next)

