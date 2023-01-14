import Foundation

@dynamicMemberLookup
public struct PropertyBuilder<Base> {
    // MARK: - Properties
    private let base: Base
    // MARK: - Initalizer
    public init(_ base: Base) {
        self.base = base
    }
    // MARK: - Subscript
    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Base, Value>) -> (Value) -> PropertyBuilder<Base> {
        return { [base] value in
            var object = base
            object[keyPath: keyPath] = value
            return PropertyBuilder(object)
        }
    }
    // MARK: - Method
    public func set<Value>(_ keyPath: WritableKeyPath<Base, Value>, to value: Value) -> PropertyBuilder<Base> {
        var object = self.base
        object[keyPath: keyPath] = value
        return PropertyBuilder(object)
    }

    // MARK: - Build
    public var build: Base { return self.base }
    public var buildNoReture: Void
}
extension PropertyBuilder {
    public func with(_ handler: (inout Base) -> Void) -> PropertyBuilder<Base> {
        PropertyBuilder(self.with(handler))
    }
    public func with(_ handler: (inout Base) -> Void) -> Base {
      var object = self.base
      handler(&object)
      return object
    }
}
