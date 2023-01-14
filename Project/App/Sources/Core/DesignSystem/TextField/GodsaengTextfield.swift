import UIKit

final class GodsaengTextfield: UITextField {
    //MARK: - property

    let textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )
    
    //MARK: - initalizer
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .ColorSystem.Color.gray2.color
        self.layer.cornerRadius = 8
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension GodsaengTextfield {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
