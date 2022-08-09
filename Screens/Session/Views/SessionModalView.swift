import SwiftUI

struct SessionModalView: View {
    
    let model: SessionModel
    
    var body: some View {
        NavigationView {
            SessionDetailView(viewModel: .init(
                input: .init(),
                output: .init(model: model)
            ))
            .navigationBarTitle(model.track.name, displayMode: .inline)
        }
        .navigationViewStyle(.stack)
    }
}
