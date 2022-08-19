import SwiftUI
import PlaygroundTester

// MARK: - APP
@main
struct MainApp: App {
    
    // MARK: Property
    
    @Environment(\.router) private var router
    
    // MARK: Initializer
    
    init() {
        // if library is fixed, open code
        // PlaygroundTester.PlaygroundTesterConfiguration.isTesting = false
    }
    
    // MARK: View
    
    var body: some Scene {
        WindowGroup {
            router.routeToRoot()
            
// if library is fixed, chnage code
//            PlaygroundTester.PlaygroundTesterWrapperView {
//                router.routeToRoot()
//            }
        }
    }
}
