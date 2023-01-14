import Foundation
import Moya

public class BaseRemoteDataSource<API: GodsaeongAPI> {
    private let keychain: any Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        keychain: any Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain

        #if DEBUG
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), NetworkLoggerPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain)])
        #endif
    }

    @discardableResult
    public func request<T: Decodable>(_ api: API, dto: T.Type) async throws -> T {
        let res = try await checkIsApiNeedsAuth(api) ? authorizedRequest(api) : defaultRequest(api)
        return try decoder.decode(dto, from: res.data)
    }

    public func request(_ api: API) async throws {
        _ = try await checkIsApiNeedsAuth(api) ? authorizedRequest(api) : defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                try _Concurrency.Task<Never, Never>.checkCancellation()
                return try await performRequest(api)
            } catch {
                continue
            }
        }
        try _Concurrency.Task<Never, Never>.checkCancellation()
        return try await performRequest(api)
    }

    func authorizedRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                try _Concurrency.Task<Never, Never>.checkCancellation()
                return try await performRequest(api)
            } catch {
                continue
            }
        }
        try _Concurrency.Task<Never, Never>.checkCancellation()
        return try await performRequest(api)
    }

    func performRequest(_ api: API) async throws -> Response {
        try await withCheckedThrowingContinuation { config in
            provider.request(api) { result in
                switch result {
                case let .success(res):
                    config.resume(returning: res)

                case let .failure(err):
                    let code = err.response?.statusCode ?? 500
                    config.resume(
                        throwing: api.errorMap[code] ?? .unknown(message: "알 수 없는 에러가 발생했습니다.")
                    )
                }
            }
        }
    }

    func checkIsApiNeedsAuth(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }
}
