import SwiftUI

struct SessionEnvironment: DynamicProperty {
    @Environment(\.router) var router
}
