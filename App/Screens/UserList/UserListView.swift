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
                environment.router.routeToSns(with: $0)
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
