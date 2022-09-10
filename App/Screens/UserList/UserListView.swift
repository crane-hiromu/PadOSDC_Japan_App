import SwiftUI

// MARK: - View
struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    let environment: UserListEnvironment
    
    var body: some View {
        ScrollView { userList }
            .frame(maxWidth: .infinity)
            .navigationBarTitle(viewModel.output.title, displayMode: .inline)
            .onReceive(viewModel.output.openSns) {
                environment.router.routeToWeb(with: $0)
            }
    }
}

// MARK: - Private
private extension UserListView {
    
    var userList: some View {
        LazyVStack(spacing: 0) {
            ForEach(viewModel.output.models, id: \.name) { user in
                HStack {
                    UserListRow(
                        user: user,
                        didTap: { viewModel.input.didTapSns.send(user) }
                    )
                    Spacer()
                }
                .padding(.all, 4)
                .background(Color.secondarySystemBackground)
                .cornerRadius(12)
            }
            .padding([.top, .bottom], 4)
        }
        .padding(.all, 16)
    }
}

// TODO move
enum UserListSection {
    case core, temporary, network
    
    private var name: String {
        switch self {
        case .core: return "コア"
        case .temporary: return "当日"
        case .network: return "ネットワーク"
        }
    }
    
    var title: String { "\(name)スタッフ" }
}


//shimastripe
//
//sugiken
//
//Zucchi
//
//しもとり
//
//とある鶴
