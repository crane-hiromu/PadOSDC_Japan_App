import SwiftUI

@main
struct MainApp: App {
    
    init() {
        Configurator.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: .init())
        }
    }
}
