import SwiftUI
import PlaygroundTester

// MARK: - APP
@main
struct MainApp: App {
    
    // MARK: Property
    
    @Environment(\.router) private var router
    
    // MARK: Initializer
    
    init() {
        PlaygroundTester.PlaygroundTesterConfiguration.isTesting = false
    }
    
    // MARK: View
    
    var body: some Scene {
        WindowGroup {
            PlaygroundTester.PlaygroundTesterWrapperView {
                router.routeToRoot()
            }
        }
    }
}
