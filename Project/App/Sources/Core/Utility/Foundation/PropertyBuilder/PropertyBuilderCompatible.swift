import Foundation
import Swinject
import IQKeyboardManagerSwift

public protocol PropertyBuilderCompatible {
    associatedtype Base
    var builder: PropertyBuilder<Base> { get }
}

extension PropertyBuilderCompatible {
    public var builder: PropertyBuilder<Self> {
        PropertyBuilder(self)
    }
}

extension NSObject: PropertyBuilderCompatible {}
extension JSONEncoder: PropertyBuilderCompatible {}
extension JSONDecoder: PropertyBuilderCompatible {}

// MARK: - Swinject
extension Container: PropertyBuilderCompatible {}

// MARK: - IQKeyboard
extension IQKeyboardManager.Base: PropertyBuilderCompatible {}
