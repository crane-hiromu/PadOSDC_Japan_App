import SwiftUI

// MARK: - View
struct InfoSection: View {
    let key: LocalizedStringKey
    
    var body: some View {
        HStack(spacing: 8) {
            Text(key)
                .padding(.top, 16)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding([.leading, .trailing], 16)
    }
}
