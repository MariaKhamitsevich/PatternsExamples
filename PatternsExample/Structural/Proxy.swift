import Foundation

protocol Coffee {
    var volumeML: Int { get set }
}

struct Espresso: Coffee {
    var volumeML: Int
}

protocol CoffeeMakerProtocol {
    func makeCoffee() -> Coffee
}

final class CoffeeMachine: CoffeeMakerProtocol {
    func makeCoffee() -> Coffee {
        Espresso(volumeML: 50)
    }
    
    
}

final class BaristaProxy: CoffeeMakerProtocol {
    
    private lazy var coffeeMaker: CoffeeMakerProtocol = CoffeeMachine()
    
    func makeCoffee() -> Coffee {
        let machineEspresso = coffeeMaker.makeCoffee()
        let baristaEspresso = Espresso(volumeML: machineEspresso.volumeML * 2)
        return baristaEspresso
    }
    
    
}

final class Client {
    let coffeeMaker: CoffeeMakerProtocol
    var coffee: Coffee?
    
    init(coffeeMaker: CoffeeMakerProtocol) {
        self.coffeeMaker = coffeeMaker
    }
    
    func getCoffee() {
       coffee = coffeeMaker.makeCoffee()
    }
}
