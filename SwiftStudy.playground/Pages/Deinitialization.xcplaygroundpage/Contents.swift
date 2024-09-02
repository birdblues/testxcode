//: [Previous](@previous)

//: # 초기화 해제
//: ## 초기화 해제 동작
//: deinit
//: ## 초기화 해제 구문
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coin numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = Bank.distribute(coin: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coin: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("These are now \(Bank.coinsInBank) coins left in the bank")

playerOne!.win(coins: 2_000)
print("PlayerOne  won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("the bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")







//: [Next](@next)
