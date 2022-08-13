import SwiftUI
import PlaygroundTester

@main
struct MainApp: App {
    
    @Environment(\.router) var router
    
    init() {
        Configurator.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            PlaygroundTester.PlaygroundTesterView()
//            router.routeToRoot()
        }
    }
}
