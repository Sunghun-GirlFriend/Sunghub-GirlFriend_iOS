import Foundation

public extension String {
    var dataEncoded: Data {
        return self.data(using: .utf8)!
    }
    var stringToNSMutableString: NSMutableString {
        return NSMutableString(string: self)
    }
}
