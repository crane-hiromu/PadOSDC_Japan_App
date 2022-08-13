import SwiftUI

// MARK: - Section
struct SessionSection: View {
    @Binding var isExpanded: Bool
    let sessionType: SessionType
    let didTapRow: (SessionModel) -> Void
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            ForEach(sessionType.models, id: \.id) { model in
                SessionRow(model: model) {
                    didTapRow(model)
                }
            }
        } label: { 
            SessionSectionLabel(time: sessionType.time) 
        }
        .padding(.init(top: 8, leading: 16, bottom: 4, trailing: 16))
    }
}

// MARK: - Private View
private struct SessionSectionLabel: View {
    let time: String
    
    var body: some View {
        Text(time)
            .font(.title2)
            .foregroundColor(.white)
    }
}
