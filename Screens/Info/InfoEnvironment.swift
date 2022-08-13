import SwiftUI

// MARK: - Environment
struct InfoEnvironment: DynamicProperty {
    @Environment(\.router) var router
    @Environment(\.dismiss) var dismiss
}
