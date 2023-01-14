import UIKit

public extension UIView {
    func addSubViews(_ subView: UIView...) {
        subView.forEach(addSubview(_:))
    }
}
