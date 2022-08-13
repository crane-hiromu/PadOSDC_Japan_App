import SwiftUI

// MARK: - Environment
struct RootEnvironment: DynamicProperty {
    @Environment(\.router) var router
}
