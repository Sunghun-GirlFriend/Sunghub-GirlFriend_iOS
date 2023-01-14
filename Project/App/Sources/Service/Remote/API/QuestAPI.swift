import Foundation
import Moya

enum QuestAPI {
    case change
    case check
    case create
    case list
}

extension QuestAPI: GodsaeongAPI {
    var domain: GodsaeongDomain {
        return .quest
    }
    var urlPath: String {
        switch self {
        case .change:
            return "/"
        case .check:
            return "/"
        case .create, .list:
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .change, .check:
            return .patch
        case .create:
            return .post
        case .list:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .change:
            return .requestPlain
        case .check:
            return .requestPlain
        case .create:
            return .requestPlain
        case .list:
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
        case .check, .change, .list, .create:
            return [
                400: .unknown()
            ]
        }
    }
    
}

