import UIKit

protocol GodSangColorable {
    var color: UIColor { get }
}

public extension UIColor {
    enum ColorSystem {
        case color(Color)
    }

    static func gui(_ style: ColorSystem) -> UIColor {
        switch style {
        case let .color(color):
            return color.color
        }
    }
}
public extension UIColor.ColorSystem {
    enum Color: GodSangColorable {
        case main1
        case main2
        case main3
        case main4
        case main5
        case sub1
        case sub2
        case sub3
        case error
        case check
        case focus
    }
}


public extension UIColor.ColorSystem.Color {
    var color: UIColor {
        switch self {
        case .main1:
            return GodsangIOSAsset.Color.main1.color
        case .main2:
            return GodsangIOSAsset.Color.main2.color
        case .main3:
            return GodsangIOSAsset.Color.main3.color
        case .main4:
            return GodsangIOSAsset.Color.main4.color
        case .main5:
            return GodsangIOSAsset.Color.main5.color
        case .sub1:
            return GodsangIOSAsset.Color.sub1.color
        case .sub2:
            return GodsangIOSAsset.Color.sub2.color
        case .sub3:
            return GodsangIOSAsset.Color.sub3.color
        case .error:
            return GodsangIOSAsset.Color.error.color
        case .check:
            return GodsangIOSAsset.Color.check.color
        case .focus:
            return GodsangIOSAsset.Color.focus.color
        }
    }
}
