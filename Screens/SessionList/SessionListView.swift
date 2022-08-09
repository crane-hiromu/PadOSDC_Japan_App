import SwiftUI

struct SessionListView: View {
    
    @ObservedObject var viewModel: SessionListViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                SessionList(
                    models: viewModel.binding.models, 
                    size: proxy.size
                )
            }
        }
        .searchable(
            text: $viewModel.binding.searchText.value, 
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: Text("タイトル、説明、登壇者")
        )
        .frame(maxWidth: .infinity)
        .background(.black)
        .navigationTitle("セッションを探す")
    }
}

private struct SessionList: View {
    
    let models: [SessionModel]
    let size: CGSize
    
    var body: some View {
        if models.isEmpty {
            SessionListEmptyView(size: size)
        } else {
            VStack(spacing: 8) {
                ForEach(models, id: \.self) { model in
//                    NavigationLink(
//                        destination: SessionSectionTargetView(model: model),
//                        label: { SessionRow(model: model) }
//                    )
                }
            }
            .padding(.all, 16)
        }
    }
}

private struct SessionListEmptyView: View {
    
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: "exclamationmark.octagon")
                .resizable()
                .frame(width: 60, height: 60)
            Text("該当するセッションが見つかりませんでした。")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: size.width, height: size.height)
    }
}
