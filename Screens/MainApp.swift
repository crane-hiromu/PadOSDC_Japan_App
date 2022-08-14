#if TESTING_ENABLED
import PlaygroundTester
#endif
import SwiftUI

// MARK: - APP
@main
struct MainApp: App {
    
    // MARK: Property
    
    @Environment(\.router) private var router
    
    // MARK: Initializer
    
    init() {
        Configurator.configure()
    }
    
    // MARK: View
    
    var body: some Scene {
        WindowGroup {
            router.routeToRoot()
        }
    }
}
