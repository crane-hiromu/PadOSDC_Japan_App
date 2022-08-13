import SwiftUI

// MARK: - Row Content
struct InfoRowContent: View {
    let type: InfoType
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.icon)
            Text(type.label)
                .font(.title2)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 16)
        .background(Color.secondarySystemBackground)
        .cornerRadius(12)
    }
}
