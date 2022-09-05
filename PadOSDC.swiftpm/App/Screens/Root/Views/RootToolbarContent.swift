import SwiftUI

// MARK: - ToolbarContent
struct RootToolbarContent<L: View, R: View>: ToolbarContent {
    @ViewBuilder let leadingContent: () -> L
    @ViewBuilder let trailingContent: () -> R
        
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading, content: leadingContent)
        ToolbarItem(placement: .navigationBarTrailing, content: trailingContent)
    }
}
