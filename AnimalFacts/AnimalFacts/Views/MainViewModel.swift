import Foundation
import Resolver

@MainActor
final class MainViewModel: ObservableObject {
    @Published var cat: Cat?
    @Published var dog: Dog?
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    @Injected private var networkChecker: NetworkChecker
    @Injected private var dataDownloader: DataDownloader
    
    func catFact() -> String { cat?.fact ?? Strings.MainView.catFactPlaceholder }
    
    func dogFacts() -> String { dog?.facts.first ?? Strings.MainView.dogFactPlaceholder }
    
    func fetchCatFact() async {
        guard networkChecker.connectionIsAvailable else {
            print(APIError.noInternetConnection)
            errorAlert(title: Strings.MainView.noInternetConnectionAlertTitle, message: Strings.MainView.noInternetConnectionAlertMessage)
            return
        }
        
        do {
            cat = try await dataDownloader.downloadData(type: Cat.self, for: Constants.Endpoints.catFactURL)
        } catch {
            print(APIError.fetchFailure(description: error.localizedDescription))
            errorAlert(title: Strings.MainView.somethingWentWrongAlertTitle, message: Strings.MainView.somethingWentWrongAlertMessage)
        }
    }
    
    func fetchDogFact() async {
        guard networkChecker.connectionIsAvailable else {
            print(APIError.noInternetConnection)
            errorAlert(title: Strings.MainView.noInternetConnectionAlertTitle, message: Strings.MainView.noInternetConnectionAlertMessage)
            return
        }
        
        do {
            dog = try await dataDownloader.downloadData(type: Dog.self, for: Constants.Endpoints.dogFactsURL)
        } catch {
            print(APIError.fetchFailure(description: error.localizedDescription))
            errorAlert(title: Strings.MainView.somethingWentWrongAlertTitle, message: Strings.MainView.somethingWentWrongAlertMessage)
        }
    }
    
    private func errorAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
