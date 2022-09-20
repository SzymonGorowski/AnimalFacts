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
        case .incorrectURL: return "Incorrect URL"
        case .noInternetConnection: return "No internet connection"
        case .invalidResponse: return "Request failed"
        case let .unsuccessfulResponse(description): return "Response unsuccessful with error -> \(description)"
        case let .decodingFailure(description): return "JSON Decoding Failure with error -> \(description)"
        case let .fetchFailure(description): return "Fetch failed with error -> \(description)"
        }
    }
}
