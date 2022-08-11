import SwiftUI

struct SessionListView: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: SessionListViewModel
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    SessionList(
                        models: viewModel.binding.models, 
                        size: proxy.size,
                        didTapRow: { viewModel.input.didTapSession.send($0) }
                    )
                }
            }
            .toolbar {
                CloseToolbarContent { presentation.wrappedValue.dismiss() }
            }
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
            content: { SessionSheetView(model: viewModel.output.modalModel) }
        )
    }
}

private struct SessionList: View {
    
    let models: [SessionModel]
    let size: CGSize
    let didTapRow: (SessionModel) -> Void
    
    var body: some View {
        if models.isEmpty {
            SessionEmptyView(size: size)
        } else {
            VStack(spacing: 8) {
                ForEach(models, id: \.self) { model in
                    SessionRow(model: model) {
                        didTapRow(model)
                    }
                }
            }
            .padding(.all, 16)
        }
    }
}

