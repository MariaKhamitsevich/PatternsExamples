import Foundation

enum CupMaterial {
    case ceramics
    case porcelain
}

struct CoffeInCup {
    
    let cupMaterial: CupMaterial
    let coffee: Coffee
}

final class BaristaAdapter {
    private var coffeeMaker: CoffeeMakerProtocol
    
    init(coffeeMaker: CoffeeMakerProtocol) {
        self.coffeeMaker = coffeeMaker
    }
    
    func makeCoffeeInCup(material: CupMaterial) -> CoffeInCup {
        let machineEspresso = coffeeMaker.makeCoffee()
        let baristaEspresso = CoffeInCup(cupMaterial: material, coffee: machineEspresso)
        return baristaEspresso
    }
}
