import Foundation

public struct AuthInfoDTO: Encodable {
    public init(userId: String, userPw: String) {
        self.userId = userId
        self.userPw = userPw
    }

    public let userId: String
    public let userPw: String
}
