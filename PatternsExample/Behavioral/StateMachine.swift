import Foundation

enum Lights {
    case green
    case yellow
    case red
}

protocol TrafficLight: AnyObject {
    var previousLight: Lights { get set }
    var rule: RuleProtocol? { get set }
    func changeColor()
}

final class GreenTrafficLight: TrafficLight {
    var previousLight: Lights
    weak var rule: RuleProtocol?
    
    init(previousLight: Lights) {
        self.previousLight = previousLight
    }
    
    
    func changeColor() {
        rule?.changeLight(on: YellowTrafficLight(previousLight: .green) )
        rule?.prepareSignal()
    }
}

final class YellowTrafficLight: TrafficLight {
    var previousLight: Lights
    weak  var rule: RuleProtocol?
    
    init(previousLight: Lights) {
        self.previousLight = previousLight
    }
    
    func changeColor() {
        switch previousLight {
        case .green:
            rule?.changeLight(on: RedTrafficLight(previousLight: .yellow))
            rule?.waitSignal()
        case .yellow:
            rule?.changeLight(on: YellowTrafficLight(previousLight: .yellow))
            rule?.warningSignal()
        case .red:
            rule?.changeLight(on: GreenTrafficLight(previousLight: .yellow))
            rule?.enableSignal()
        }
    }
}

final class RedTrafficLight: TrafficLight {
    var previousLight: Lights
    weak var rule: RuleProtocol?
    
    init(previousLight: Lights) {
        self.previousLight = previousLight
    }
    
    func changeColor() {
        rule?.changeLight(on: YellowTrafficLight(previousLight: .red))
        rule?.prepareSignal()
    }
}

protocol RuleProtocol: AnyObject {
    func changeLight(on light: TrafficLight)
    func enableSignal()
    func prepareSignal()
    func warningSignal()
    func waitSignal()
}

final class Rule: RuleProtocol {
    var message: String
    var trafficLight: TrafficLight
    
    init(message: String, trafficLight: TrafficLight) {
        self.message = message
        self.trafficLight = trafficLight
    }
    
    func changeLight(on light: TrafficLight) {
        trafficLight = light
    }
    
    func signal() {
        trafficLight.rule = self
        trafficLight.changeColor()
    }
    
    func enableSignal() {
        message = "Go!"
    }
    
    func prepareSignal() {
        message = "Ghange signal"
    }
    
    func warningSignal() {
        message = "Keep patience"
    }
    
    func waitSignal() {
        message = "Wait!"
    }
}
