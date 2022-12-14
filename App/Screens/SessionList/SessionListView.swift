import SwiftUI

// MARK: - View
struct SessionListView: View {
    @ObservedObject var viewModel: SessionListViewModel
    let environment: SessionListEnvironment
    
    var body: some View {
        NavigationView {
            sessionListWrapper
                .toolbar { closeToolbarContent }
                .frame(maxWidth: .infinity)
                .navigationBarTitle(Text(""), displayMode: .inline)
        }
        .searchable(
            text: $viewModel.binding.searchText.value, 
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: Text(L10n.sessionListSearchPlaceholder)
        )
        .sheet(
            isPresented: $viewModel.binding.isShownModal,
            onDismiss: { viewModel.input.didCloseModal.send(()) },
            content: { sessionSheetView }
        )
        .onReceive(viewModel.output.dismissView) {
            environment.dismiss()
        }
    }
}

// MARK: - Private
private extension SessionListView {
    
    var sessionListWrapper: some View {
        GeometryReader { proxy in
            if viewModel.binding.models.isEmpty {
                EmptyView(type: .session, size: proxy.size)
            } else {
                sessionList
            }
        }
    }
    
    var sessionList: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.binding.models, id: \.self) { model in
                    SessionListRow(
                        model: model,
                        searchText: $viewModel.binding.searchText.value,
                        didTap: { viewModel.input.didTapSession.send(model) }
                    )
                }
            }
            .padding(.all, 16)
        }
    }
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
    
    var sessionSheetView: SessionSheetWrapperView {
        .init(model: viewModel.output.modalModel, router: environment.router)
    }
}
