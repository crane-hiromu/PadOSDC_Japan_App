import SwiftUI

// MARK: - ToolbarContent
struct RootToolbarContent<L: View, R: View>: ToolbarContent {
    let leadingContent: () -> L
    let trailingContent: () -> R
    
    init(
        @ViewBuilder leading: @escaping () -> L,
        @ViewBuilder trailing: @escaping () -> R
    ) {
        self.leadingContent = leading
        self.trailingContent = trailing
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading, content: leadingContent)
        ToolbarItem(placement: .navigationBarTrailing, content: trailingContent)
    }
}
