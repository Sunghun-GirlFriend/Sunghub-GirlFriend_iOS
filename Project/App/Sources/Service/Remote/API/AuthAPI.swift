import Foundation
import Moya

enum AuthAPI {
    case signin
    case signup
}

extension AuthAPI: GodsaeongAPI {
    var domain: GodsaeongDomain {
        return .auth
    }
    var urlPath: String {
        switch self {
        case .signin:
            return "/sign-in"
        case .signup:
            return "/sign-up"
        }
    }
    var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .signin:
            return .requestPlain
        case .signup:
            return .requestPlain
        }
    }
    var jwtTokenType: JwtTokenType? {
        switch self {
        default:
            return JwtTokenType.none
        }
    }
    var errorMap: [Int: GodsaeongError] {
        switch self {
        case .signin:
            return [
                400: .unknown()
            ]
        case .signup:
            return [
                400: .unknown()
            ]
        }
    }
    
}

