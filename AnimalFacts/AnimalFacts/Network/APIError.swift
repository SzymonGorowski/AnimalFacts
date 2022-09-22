import Foundation

enum APIError: Error {
    case incorrectURL
    case noInternetConnection
    case invalidResponse
    case unsuccessfulResponse(description: String)
    case decodingFailure(description: String)
    case fetchFailure(description: String)
    
    var customDescription: String {
        switch self {
        case .incorrectURL: return Strings.APIError.incorrectURL
        case .noInternetConnection: return Strings.APIError.noInternetConnection
        case .invalidResponse: return Strings.APIError.invalidResponse
        case let .unsuccessfulResponse(description): return String(format: Strings.APIError.unsuccessfulResponse, arguments: [description])
        case let .decodingFailure(description): return String(format: Strings.APIError.decodingFailure, arguments: [description])
        case let .fetchFailure(description): return String(format: Strings.APIError.fetchFailure, arguments: [description])
        }
    }
}
