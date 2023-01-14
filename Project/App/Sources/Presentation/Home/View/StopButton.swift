import UIKit

final class StopButton: UIButton {
    var text: String {
        get {
            return ""
        } set(newValue) {
            self.setTitle(newValue, for: .normal)
        }
    }
    
    //MARK: - Initalizer
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Method
    func setUI() {
        self.layer.borderColor = UIColor.ColorSystem.Color.main4.color.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.setTitleColor(UIColor.ColorSystem.Color.main4.color, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
}
