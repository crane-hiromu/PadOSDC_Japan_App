import SwiftUI

struct SessionDetailView: View {
    
    @Environment(\.presentationMode) var presentation
    let viewModel: SessionDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                SessionDetailNameLabel(
                    text: viewModel.output.model.title
                )
                SessionDetailUserView(
                    user: viewModel.output.model.user,
                    didTapSns: { viewModel.input.didTapSns.send(()) }
                )
                SessionDetailDescriptionLabel(
                    text: viewModel.output.model.description
                )
            }
            .padding()
        }
        .toolbar {
            CloseToolbarContent { presentation.wrappedValue.dismiss() }
        }
        .onReceive(viewModel.output.openSns) {
            UIApplication.shared.open($0)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

private struct SessionDetailNameLabel: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}

private struct SessionDetailDescriptionLabel: View {
    
    let text: String?
    
    var body: some View {
        if let text = text {
            Text(text)
                .font(.body)
                .foregroundColor(.white)
                .padding(.all, 16)
                .background(Color.secondarySystemBackground)
                .cornerRadius(12)
        }
    }
}
