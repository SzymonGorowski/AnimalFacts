import Foundation
import Network

protocol NetworkChecker {
    var connectionIsAvailable: Bool { get }
}

final class DefaultNetworkChecker: NetworkChecker {
    var connectionIsAvailable: Bool = false
    private let monitor = NWPathMonitor()
    
    init() {
        monitorNetwork()
    }
    
    private func monitorNetwork() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.connectionIsAvailable = true
            } else {
                self.connectionIsAvailable = false
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}
