import Foundation
import Moya

public protocol GodsaeongAPI: TargetType, JwtAuthorizable {
    var domain: GodsaeongDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: GodsaeongError] { get }
}

public extension GodsaeongAPI {
    var baseURL: URL {
        URL(string: "172.20.10.3:8888") ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var validationType: ValidationType {
        .successCodes
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}

public enum GodsaeongDomain: String {
    case auth
}

extension GodsaeongDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
