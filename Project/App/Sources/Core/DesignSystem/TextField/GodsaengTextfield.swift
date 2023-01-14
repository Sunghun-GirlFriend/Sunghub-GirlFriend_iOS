import UIKit

final class GodsaengTextfield: UITextField {
    //MARK: - property
    enum GodsaengTextButtonStyle: String {
        case close = "xmark.circle.fill"
        case eye_open = "eye.fill"
        case eye_close = "eye.slash.fill"
    }
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))

    //MARK: - initalizer
    init(style: GodsaengTextButtonStyle) {
        super.init(frame: .zero)
        self.button.setImage(UIImage(systemName: style.rawValue), for: .normal)
        self.rightView = button
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension GodsaengTextfield: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        backgroundColor = .red
    }
}
