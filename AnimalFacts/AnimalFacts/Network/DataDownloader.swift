import Foundation

protocol DataDownloader {
    func downloadData<T: Decodable>(type: T.Type, for urlString: String) async throws -> T
}

extension DataDownloader {
    func downloadData<T: Decodable>(type: T.Type, for urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw APIError.incorrectURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw APIError.invalidResponse }
        
        guard httpResponse.statusCode == 200 else { throw APIError.unsuccessfulResponse(description: "\(httpResponse.statusCode)") }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw APIError.decodingFailure(description: error.localizedDescription)
        }
    }
}

final class DefaultDataDownloader: DataDownloader { }
