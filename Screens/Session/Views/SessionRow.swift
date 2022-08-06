import SwiftUI

struct SessionRow: View {
    
    let model: SessionModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    SessionTag(text: model.track.name, color: .gray)
                    if model.isSponsor {
                        SessionTag(text: "Sponsor", color: .green)
                    }
                    if let user = model.user {
                        SessionTag(text: user.name, color: .blue)
                    }
                }
                Text(model.title)
                    .font(.body)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.all, 8)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}
