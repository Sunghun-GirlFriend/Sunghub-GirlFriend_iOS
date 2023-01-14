import Foundation

// MARK: - Error
public enum AppError {
    public enum Basic: Error, Equatable {
        case unknown
        case custom(message: String, status: Int)
    }
}

extension AppError.Basic: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown:
            return "Unknown error occurred"
        case let .custom(message, status):
            return "Error Status: \(status) -> \(message)"
        }
    }
}

public extension Error {
    var asAppError: AppError.Basic {
        self as? AppError.Basic ?? .unknown
    }
}

