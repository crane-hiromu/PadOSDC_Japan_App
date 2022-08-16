import SwiftUI

// MARK: - Environment
struct SessionListEnvironment: DynamicProperty {
    @Environment(\.router) var router
    @Environment(\.dismiss) var dismiss
}
