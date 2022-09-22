import Foundation

enum Strings {
    enum MainView {
        static let noInternetConnectionAlertTitle: String = NSLocalizedString("No Internet Connection", comment: "")
        static let noInternetConnectionAlertMessage: String = NSLocalizedString("Please check your connection and try again", comment: "")
        static let somethingWentWrongAlertTitle: String = NSLocalizedString("Something went wrong", comment: "")
        static let somethingWentWrongAlertMessage: String = NSLocalizedString("Please try again", comment: "")
        static let catFactPlaceholder: String = NSLocalizedString("Cat is an animal", comment: "")
        static let dogFactPlaceholder: String = NSLocalizedString("Dog is an animal", comment: "")
        static let titleLabel: String = NSLocalizedString("Animal facts:", comment: "")
        static let dogFactsLabel: String = NSLocalizedString("Dog Facts:", comment: "")
        static let catFactLabel: String = NSLocalizedString("Cat Fact:", comment: "")
        static let refreshButtonTitle: String = NSLocalizedString("More facts", comment: "")
    }
    
    enum APIError {
        static let incorrectURL: String = NSLocalizedString("Incorrect URL", comment: "")
        static let noInternetConnection: String = NSLocalizedString("No internet connection", comment: "")
        static let invalidResponse: String = NSLocalizedString("Request failed", comment: "")
        static let unsuccessfulResponse: String = NSLocalizedString("Response unsuccessful with error -> %@", comment: "")
        static let decodingFailure: String = NSLocalizedString("JSON Decoding Failure with error -> %@", comment: "")
        static let fetchFailure: String = NSLocalizedString("Fetch failed with error -> %@", comment: "")
    }
}
