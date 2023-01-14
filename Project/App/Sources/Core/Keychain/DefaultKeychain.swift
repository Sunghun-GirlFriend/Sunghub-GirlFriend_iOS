import Foundation

public struct DefaultKeychain: Keychain {
    // MARK: - Initalizer
    public init() {}

    private let service = Bundle.main.bundleIdentifier ?? ""
    private let encoding = String.Encoding.utf8.rawValue
    // MARK: - Keychain Feature
    public func save(type: KeychainType, value: NSMutableString) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrServer: service,
            kSecAttrAccount: type.rawValue,
            kSecValueData: value.data(using: encoding) ?? .init()
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    public func load(type: KeychainType) -> NSMutableString {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrServer: service,
            kSecAttrAccount: type.rawValue,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: kCFBooleanTrue!
        ]
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query, &dataTypeRef)
        guard status != errSecSuccess else {
            guard let data = dataTypeRef as? Data else { return "" }
            return NSMutableString(data: data, encoding: encoding) ?? ""
        }
        return ""
    }

    public func delete(type: KeychainType) {
    }
}
