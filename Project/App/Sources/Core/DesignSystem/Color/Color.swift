import UIKit
import SwiftUI

protocol GodSangColorable {
    var color: UIColor { get }
}

extension GodsangIOSColors {
    var suiColor: SwiftUI.Color {
        return SwiftUI.Color(self.color)
    }
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
        case gray1
        case gray2
        case gray3
        case gray4
        case gray5
        case gray6
        case gray7
        case gray8
        case gray9
        case background
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
        case .gray1:
            return GodsangIOSAsset.Color.gray1.color
        case .gray2:
            return GodsangIOSAsset.Color.gray2.color
        case .gray3:
            return GodsangIOSAsset.Color.gray3.color
        case .gray4:
            return GodsangIOSAsset.Color.gray4.color
        case .gray5:
            return GodsangIOSAsset.Color.gray5.color
        case .gray6:
            return GodsangIOSAsset.Color.gray6.color
        case .gray7:
            return GodsangIOSAsset.Color.gray7.color
        case .gray8:
            return GodsangIOSAsset.Color.gray8.color
        case .gray9:
            return GodsangIOSAsset.Color.gray9.color
        case .background:
            return GodsangIOSAsset.Color.background.color
        }
    }
}
