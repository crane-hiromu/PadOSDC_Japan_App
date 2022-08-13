import SwiftUI

struct SessionDetailEnvironment: DynamicProperty {
    @Environment(\.router) var router
    @Environment(\.dismiss) var dismiss
}
