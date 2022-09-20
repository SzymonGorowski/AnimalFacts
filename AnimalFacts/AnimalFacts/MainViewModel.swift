import Foundation
import Resolver

@MainActor
final class MainViewModel: ObservableObject {
    @Published var cat: Cat?
    @Published var dog: Dog?
    
    @Injected private var networkChecker: NetworkChecker
    @Injected private var dataDownloader: DataDownloader
    
    func catFact() -> String { cat?.fact ?? "Cat is an animal" }
    
    func dogFacts() -> String { dog?.facts.first ?? "Dog is an animal" }
    
    func fetchCatFact() async {
        guard networkChecker.connectionIsAvailable else { print(APIError.noInternetConnection); return }
        
        do {
            cat = try await dataDownloader.downloadData(type: Cat.self, for: Constants.Endpoints.catFactURL)
        } catch {
            print(APIError.fetchFailure(description: error.localizedDescription))
        }
    }
    
    func fetchDogFact() async {
        guard networkChecker.connectionIsAvailable else { print(APIError.noInternetConnection); return }
        
        do {
            dog = try await dataDownloader.downloadData(type: Dog.self, for: Constants.Endpoints.dogFactsURL)
        } catch {
            print(APIError.fetchFailure(description: error.localizedDescription))
        }
    }
}
