import SwiftUI

// MARK: - Row
struct SessionListRow: View {
    let model: SessionModel
    @Binding var searchText: String
    let didTap: () -> Void
    
    var body: some View {
        Button(action: didTap) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        SessionRowTrackTag(name: model.track.name)
                        SessionRowSponsorTag(isSponsor: model.isSponsor)
                        SessionRowLtTag(isLT: model.isLT)
                        SessionRowUserTag(user: model.user)
                    }
                    .padding(.bottom, 4)
                    
                    SessionListRowTitleLabel(text: model.attributedTitleText(with: searchText))
                    SessionListRowBodyLabel(text: model.attributedBodyText(with: searchText))
                }
                .padding(.all, 2)
                
                Spacer()
            }
        }
        .padding(.all, 8)
        .background(Color.secondarySystemBackground)
        .cornerRadius(12)
    }
}

// MARK: - Title Label
private struct SessionListRowTitleLabel: View {
    let text: AttributedString

    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Body Label
private struct SessionListRowBodyLabel: View {
    let text: AttributedString?
    
    var body: some View {
        if let attributedText = text {
            Text(attributedText)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
    }
}
