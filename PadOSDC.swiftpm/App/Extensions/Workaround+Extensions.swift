import SwiftUI
import SwiftUIWorkaround

extension Workaround {
    func preferredAppearanceMode(_ colorScheme: Binding<AppearanceMode>) -> some View {
        self.preferredColorScheme(.init(get: {
            colorScheme.wrappedValue.colorScheme
        }, set: { newValue in
            colorScheme.wrappedValue = newValue.appearanceMode
        }))
    }
}
