import SwiftUI

// MARK: - Row
struct SessionRow: View {
    let model: SessionModel
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
                    
                    SessionRowTitleLabel(title: model.title)
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

// MARK: - Track Tag
struct SessionRowTrackTag: View {
    
    let name: String
    
    var body: some View {
        SessionTag(text: name, color: .gray)
    }
}

// MARK: - Sponsor Tag
struct SessionRowSponsorTag: View {
    
    let isSponsor: Bool
    
    var body: some View {
        if isSponsor {
            SessionTag(text: L10n.sessionRowTagSponsor, color: .green)
        }
    }
}

// MARK: - LT Tag
struct SessionRowLtTag: View {
    
    let isLT: Bool
    
    var body: some View {
        if isLT {
            SessionTag(text: L10n.sessionRowTagLT, color: .yellow)
        }
    }
}

// MARK: - User Tag
struct SessionRowUserTag: View {
    
    let user: SessionUser?
    
    var body: some View {
        if let user = user {
            SessionTag(text: user.name, color: .blue)
        }
    }
}

// MARK: - Title Label
private struct SessionRowTitleLabel: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.body)
            .lineLimit(1)
            .foregroundColor(.primary)
    }
}
