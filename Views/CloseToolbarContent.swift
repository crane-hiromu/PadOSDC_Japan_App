import SwiftUI

// MARK: - ToolbarContent
struct CloseToolbarContent: ToolbarContent {
    let didTapClose: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: didTapClose) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
    }
}
