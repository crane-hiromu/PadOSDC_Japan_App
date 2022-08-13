import SwiftUI

// MARK: - View
struct SessionDetailView: View {
    let viewModel: SessionDetailViewModel
    let environment: SessionDetailEnvironment
    
    var body: some View {
        ScrollView { content }
            .toolbar { closeToolbarContent }
            .onReceive(viewModel.output.openSns) {
                environment.router.routeToSns(with: $0)
            }
            .onReceive(viewModel.output.dismissView) {
                environment.dismiss()
            }
            .frame(maxWidth: .infinity)
            .background(.black)
    }
}

// MARK: - Private
private extension SessionDetailView {
    
    var content: some View {
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
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
}

// MARK: - Label
private struct SessionDetailNameLabel: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}

// MARK: - Label
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
