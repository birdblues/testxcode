//: [Previous](@previous)

//: # 문자열과 문자
//: Swift의 String 타입은 Foundation의 NSString 클래스와 연결되어 있습니다. Foundation은 또한 NSString 에 의해 정의된 메서드를 노출시키기 위해 String 을 확장합니다. 이것은 Foundation을 import 하면 캐스팅 없이 String 에서 NSString 메서드를 접근할 수 있습니다.

//: ## 문자열 리터럴

let someString = "Some string literal value"

//: ### 여러줄 문자열 리터럴

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""


let singleLineString = "These are the same."
let multilineString = """
These are the same
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
softWrappedQuotation

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
lineBreaks


let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
    """
linesWithIndentation


//: ### 문자열 리터럴에 특수 문자

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
threeDoubleQuotationMarks

//: ### 확장된 문자열 구분기호
let threeMoreDoubleQuotationMarks = #"""
Here are \#nthree more double quotes:\n """
"""#
threeMoreDoubleQuotationMarks


//: ## 빈 문자열 초기화
var emptyString = ""
var anotherEmptyString = String()
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}

//: ## 문자열 변경
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

//: ## 문자열은 값 타입
//: Swift의 String 타입은 값 타입 (value type) 입니다. 새로운 String 값을 생성한다면 String 값은 함수 또는 메서드에 전달될 때나 상수 또는 변수에 대입될 때 복사 됩니다.

//: ## 문자 작업

for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//: ## 문자열과 문자 연결

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
welcome

var instruction  = "look over"
instruction += string2
instruction

welcome.append(exclamationMark)

let badStart = """
one
two
"""
let end = """
three
"""
badStart + end

let goodStart = """
one
two

"""
goodStart + end

//: ## 문자열 삽입
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift user \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)


//: ## 유니코드
//: ### 유니코드 스칼라 값
//: ### 확장된 문자소 클러스터
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é


let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let ㅎ: Character = "\u{1112}"
let ㅏ: Character = "\u{1161}"
let ㄴ: Character = "\u{11AB}"
"\(ㅎ)\(ㅏ)\(ㄴ)"
"\(ㅎ)\(ㅏ)\(ㄴ)".count
"\(ㅎ)\(ㅏ)\(ㄴ)" == String(precomposed)
"\(ㅎ)\(ㅏ)\(ㄴ)" == String(decomposed)

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸


//: ## 문자 카운팅
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

//: 확장된 문자소 클러스터는 여러개의 유니코드 스칼라로 구성할 수 있습니다. 이것은 다른 문자와 같은 문자의 다른 표기법은 저장할 때 메모리 사용량이 다르게 요구할 수 있다는 의미입니다. 이 때문에 Swift의 문자는 각각 문자열에서 동일한 양의 메모리를 차지하지 않습니다. 그 결과 문자열에 문자의 개수는 확장된 문자소 클러스터 경계를 결정하기 위해 문자열을 반복하지 않고는 계산할 수 없습니다. 특히 긴 문자열 값으로 작업하는 경우에 해당 문자열의 문자를 결정하려면 count 프로퍼티가 전체 문자열의 유니코드 스칼라를 반복해야 합니다. count 프로퍼티로 반환된 문자의 개수는 같은 문자여도 NSString 의 length 프로퍼티와 항상 같지는 않습니다. NSString 의 길이는 문자열 내에 유니코드 확장된 문자소 클러스터 수가 아니라 문자열의 UTF-16 표현 내의 16-bit 코드 단위 수를 기반으로 합니다.


//: ## 문자열 접근과 수정
//: ### 문자열 인덱스
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//greeting[greeting.endIndex]
//greeting.index(after: greeting.endIndex)

for index in greeting.indices {
    print("\(greeting[index])", terminator: " ")
}

//: Collection 프로토콜을 준수하는 어떠한 타입에서든 startIndex 와 endIndex 프로퍼티와 index(before:), index(after:), 그리고 index(_:offsetBy:) 메서드를 사용할 수 있습니다. 이것은 여기서 봤듯이 String 뿐만 아니라 Array, Dictionary, 그리고 Set 과 같은 콜렉션 타입도 포함됩니다.

//: ### 삽입과 삭제
welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
welcome

//: RangeReplaceableCollection 프로토콜을 준수하는 어떠한 타입에서든 insert(_:at:), insert(contentsOf:at:), remove(at:) 그리고 removeSubrange(_:) 메서드를 사용할 수 있습니다. 이것은 여기서 봤듯이 String 뿐만 아니라 Array, Dictionary, 그리고 Set 과 같은 콜렉션 타입도 포함됩니다.

//: ## 부분 문자열

let greeting2 = "Hello, world"
let index2 = greeting2.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting2[..<index2] // 위의 greeting2의 메모리를 가리킴

let newString = String(beginning) // 새로운 메모리의 문자열을 가리킴

//: ## 문자열 비교
//: ### 문자열과 문자 동등성

let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."

//: ## 접두사와 접미사 동등성

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCout = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCout += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCout) cell scenes")

//: ## 문자열의 유니코드 표현
let dogString = "Dog‼🐶"
for index in dogString.indices {
    print("\(dogString[index]) ", terminator: "")
}
print("")
// D o g ‼ 🐶

//: ### UTF-8 표현
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 226 128 188 240 159 144 182


//: ### UTF-16 표현
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

//: ### 유니코드 스칼라 표현

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

//: [Next](@next)
