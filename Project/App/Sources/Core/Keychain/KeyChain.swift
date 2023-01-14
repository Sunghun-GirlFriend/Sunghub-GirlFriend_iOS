import Foundation

public enum KeychainType: NSMutableString {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case expiredAt = "EXPIRED-AT"
}

public protocol Keychain {
    func save(type: KeychainType, value: NSMutableString)
    func load(type: KeychainType) -> NSMutableString
    func delete(type: KeychainType)
}
