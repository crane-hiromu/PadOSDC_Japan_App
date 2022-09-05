import SwiftUI

// MARK: - View
struct InfoSection: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(title)
                .padding(.top, 16)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding([.leading, .trailing], 16)
    }
}
