import SwiftUI

struct SessionSection: View {
    
    let sessionType: SessionType
    let didTapRow: (SessionModel) -> Void
    // 各セクションで持つ必要があるのでVMでは管理しない
    @State private var isExpanded = true
    
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

private struct SessionSectionLabel: View {
    
    let time: String
    
    var body: some View {
        Text(time)
            .font(.title2)
            .foregroundColor(.white)
    }
}
