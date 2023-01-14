import Foundation

public enum KeychainType: NSMutableString {
    case accessToken = "ACCESS-TOKEN"
}

public protocol Keychain {
    func save(type: KeychainType, value: NSMutableString)
    func load(type: KeychainType) -> NSMutableString
    func delete(type: KeychainType)
}
