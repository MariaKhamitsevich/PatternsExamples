import Foundation

struct Cappuccino: Coffee {
    var volumeML: Int
    var milkVolume: Int
}

final class BaristaDecorator: CoffeeMakerProtocol {
    private var coffeeMaker: CoffeeMakerProtocol
    
    init(coffeeMaker: CoffeeMakerProtocol) {
        self.coffeeMaker = coffeeMaker
    }
    
    func makeCoffee() -> Coffee {
        let machineEspresso = coffeeMaker.makeCoffee()
        let baristaEspresso = Cappuccino(volumeML: machineEspresso.volumeML, milkVolume: machineEspresso.volumeML / 2)
        return baristaEspresso
    }
}
