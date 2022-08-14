#if TESTING_ENABLED
import PlaygroundTester
#endif
import SwiftUI

@main
struct MainApp: App {
    
    @Environment(\.router) var router
    
    init() {
        Configurator.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            router.routeToRoot()
        }
    }
}
