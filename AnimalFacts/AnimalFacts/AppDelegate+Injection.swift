import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // MARK: - Networking
        main.register { DefaultNetworkChecker() as NetworkChecker }
        main.register { DefaultDataDownloader() as DataDownloader }
    }
}
