import SwiftUI

// MARK: - View
struct SessionListView: View {
    @ObservedObject var viewModel: SessionListViewModel
    let environment: SessionListEnvironment
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                SessionListWrapper(
                    models: viewModel.binding.models, 
                    size: proxy.size,
                    didTapRow: { viewModel.input.didTapSession.send($0) }
                )
            }
            .toolbar { closeToolbarContent }
            .frame(maxWidth: .infinity)
            .background(.black)
            .navigationBarTitle("Search", displayMode: .inline)
        }
        .searchable(
            text: $viewModel.binding.searchText.value, 
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: Text("タイトル、説明、登壇者")
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
    
    private var sessionSheetView: SessionSheetWrapperView {
        .init(model: viewModel.output.modalModel, router: environment.router)
    }
}

// MARK: - Private
private extension SessionListView {
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
}

// MARK: - Private View
private struct SessionListWrapper: View {
    
    let models: [SessionModel]
    let size: CGSize
    let didTapRow: (SessionModel) -> Void
    
    var body: some View {
        ScrollView {
            if models.isEmpty {
                EmptyView(type: .session, size: size)
            } else {
                sessionList
            }
        }
    }
    
    private var sessionList: some View {
        LazyVStack(spacing: 8) {
            ForEach(models, id: \.self) { model in
                SessionRow(model: model) {
                    didTapRow(model)
                }
            }
        }
        .padding(.all, 16)
    }
}
