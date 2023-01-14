import Foundation

public enum GodsaeongError: Error, Equatable {
    case unknown(message: String = "알 수 없는 에러가 발생했습니다")
}

extension GodsaeongError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unknown(message):
            return message
        }
    }
}

public extension Error {
    var asGodsaeongError: GodsaeongError {
        self as? GodsaeongError ?? .unknown()
    }
}
