import SwiftUI

// MARK: - APP
@main
struct MainApp: App {
    
    // MARK: Property
    
    @Environment(\.router) private var router
    
    // MARK: View
    
    var body: some Scene {
        WindowGroup {
            router.routeToRoot()
        }
    }
}
