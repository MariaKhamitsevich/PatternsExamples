import UIKit

protocol FactoryPatternProtocol {
    associatedtype T: UIView
    func makeViewWith(color: UIColor, text: String) -> T
    func makeViewWith(text: String, textColor: UIColor, textFont: UIFont) -> T
}


// MARK: - Abstract Factory
final class CustomViewFactory: FactoryPatternProtocol {
    
    // Factory Method
    func makeViewWith(color: UIColor, text: String) -> UIView {
        let view = CustomView()
        view.backgroundColor = color
        view.label.text = text
        return view
    }
    
    // Factory Method
    func makeViewWith(text: String, textColor: UIColor, textFont: UIFont) -> UIView {
        let view = CustomView()
        view.label.text = text
        view.label.textColor = textColor
        view.label.font = textFont
        return view
    }
}

// MARK: - Builder
protocol CustomViewBuilding {
    func add(text: String)
    func add(backgroundColor: UIColor)
    func add(textColor: UIColor)
    func getResultView() -> CustomView
}

final class CustomViewBuilder: CustomViewBuilding {
    private let customView = CustomView()
    
    func add(text: String) {
        customView.label.text = text
    }
    
    func add(backgroundColor: UIColor) {
        customView.backgroundColor = backgroundColor
    }
    
    func add(textColor: UIColor) {
        customView.label.textColor = textColor
    }
    
    func getResultView() -> CustomView {
        customView
    }
}

final class CustomView: UIView {
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(label)
        setupConstraints()
    }
    
    func setupConstraints() {
        [label.topAnchor.constraint(equalTo: self.topAnchor),
         label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         label.bottomAnchor.constraint(equalTo: self.bottomAnchor)].forEach { $0.isActive = true }
    }
}
