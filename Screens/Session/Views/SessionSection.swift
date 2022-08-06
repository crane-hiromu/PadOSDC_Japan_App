import SwiftUI

struct SessionSection: View {
    
    let sessionType: SessionType
    @State private var isExpanded = true
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            ForEach(sessionType.models, id: \.id) { model in
                NavigationLink(
                    destination: SessionDetailView(model: model),
                    label: { SessionRow(model: model) }
                )
            }
        } label: {
            Text(sessionType.time)
                .font(.title2)
                .foregroundColor(.white)
        }
        .padding(.init(top: 4, leading: 16, bottom: 8, trailing: 16))
    }
}
