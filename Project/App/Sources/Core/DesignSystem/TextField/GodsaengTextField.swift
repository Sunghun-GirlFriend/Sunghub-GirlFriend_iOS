import UIKit

final class GodsaengTextField: UITextField {
    override var placeholder: String? {
        didSet {
            self.placeholder = placeholder
        }
    }

    override var text: String? {
        didSet {
            self.text = text
        }
    }

    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? .ColorSystem.Color.gray1.color : .ColorSystem.Color.gray2.color
            self.clearButtonMode = isEnabled ? .whileEditing : .never
        }
    }

    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .ColorSystem.Color.main5.color
    }
}
