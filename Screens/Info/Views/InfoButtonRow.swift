import SwiftUI

// MARK: - Button
struct InfoButtonRow: View {
    let type: InfoType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            InfoRowContent(type: type)
        }
    }
}
