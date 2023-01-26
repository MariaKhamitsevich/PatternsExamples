import Foundation

protocol ProductProtocol {
    var name: String { get set }
    var quality: Int { get set }
}

protocol DeliveryProtocol: AnyObject {
    func deliverProduct(product: ProductProtocol)
}

struct Chocolate: ProductProtocol {
    var name: String
    var quality: Int
}

class Delivery: DeliveryProtocol {
    private let client: ChocolateFabric
    
    init(client: ChocolateFabric) {
        self.client = client
        client.delivery = self
    }
    
    func deliverProduct(product: ProductProtocol) {
        print("\(product.name) delivered")
    }
}

final class ChocolateFabric {
    weak var delivery: DeliveryProtocol?
    
    func deliverChocolate(withName: String, inQuality: Int) {
        let chocolate = Chocolate(name: withName, quality: inQuality)
        delivery?.deliverProduct(product: chocolate)
    }
}
