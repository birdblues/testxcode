//: [Previous](@previous)

//: # 옵셔널 체이닝
//: ?

//: ## 강제 언래핑의 대안으로 옵셔널 체이닝
//: ! 대신 ?

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms
// runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}

//: ## 옵셔널 체이닝에 대한 모델 클래스 정의
class AnotherPerson {
    var residence: AnotherRegidence?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentfier() -> String? {
        if let buildingNumber, let street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

class AnotherRegidence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

//: ## 옵셔널 체이니을 통한 프로퍼티 접근
let anotherJohn = AnotherPerson()
if let roomCount = anotherJohn.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
anotherJohn.residence?.address = someAddress // residence 가 nil 이기 때문에 residence 에 address 프로퍼티에 설정하기 위한 시도는 실패
anotherJohn

func createAddress() -> Address {
    print("Function was called")
    
    let someAddress = Address()
    someAddress.buildingName = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
anotherJohn.residence?.address = createAddress() //createAddress() 함수가 호출되지 않음
anotherJohn

//: ## 옵셔널 체이닝을 통한 함수 호출
if anotherJohn.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (anotherJohn.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possible to set the address")
}

//: ## 옵셔널 체이닝을 통한 서브스크립트 접근
if let firstRoomName = anotherJohn.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

anotherJohn.residence?[0] = Room(name: "Bathroom")
anotherJohn

let johnsHouse = AnotherRegidence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
anotherJohn.residence = johnsHouse

if let firstRoomName = anotherJohn.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


//: ### 옵셔널 타입에 서브슼크립트 접근
//: 딕셔너리
var testSocres = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testSocres["Dave"]?[0] = 91
testSocres["Bev"]?[0] += 1
testSocres["Brian"]?[0] = 72
testSocres

//: ## 여러 수준의 체인 연결
if let johnStreet = anotherJohn.residence?.address?.street {
    print("John's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address.")
}


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
anotherJohn.residence?.address = johnsAddress

if let johnsStreet = anotherJohn.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//: ## 옵셔널 반환값으로 메서드 체이닝
if let buildingIdentifier = anotherJohn.residence?.address?.buildingIdentfier() {
    print("John's building identifier is \(buildingIdentifier).")
}

if let beginWithThe = anotherJohn.residence?.address?.buildingIdentfier()?.hasPrefix("The") {
    if beginWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's buiding identifier does not begin with \"The\".")
    }
}

//: 위의 예제에서 연결하려는 옵셔널 값이 buildingIdentifier() 메서드 자체가 아닌 buildingIdentifier() 메서드의 반환값이므로 소괄호 뒤에 옵셔널 체이닝 물음표를 위치시킵니다.

//: [Next](@next)
