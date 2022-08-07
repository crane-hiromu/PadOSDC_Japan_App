import SwiftUI

struct SessionSection: View {
    
    let sessionType: SessionType
    @State private var isExpanded = true
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            ForEach(sessionType.models, id: \.id) {
                SessionSectionRow(model: $0)
            }
        } label: { 
            SessionSectionLabel(time: sessionType.time) 
        }
        .padding(.init(top: 4, leading: 16, bottom: 8, trailing: 16))
    }
}

private struct SessionSectionRow: View {
    
    let model: SessionModel
    
    var body: some View {
        if model.user == nil {
            SessionRow(model: model)
        } else {
            NavigationLink(
                destination: SessionDetailView(viewModel: .init(
                    input: .init(),
                    output: .init(model: model)
                )),
                label: { SessionRow(model: model) }
            )
        }
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
