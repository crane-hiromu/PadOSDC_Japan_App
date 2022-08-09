import SwiftUI

struct UserListView: View {
    
    let viewModel: UserListViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.output.models, id: \.name) { user in
                HStack {
                    UserListRow(
                        user: user,
                        didTap: { viewModel.input.didTapSns.send(user) }
                    )
                    Spacer()
                }
            }
            .padding([.top, .bottom], 24)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .onReceive(viewModel.output.openSns) {
            UIApplication.shared.open($0)
        }
        .navigationTitle("登壇者一覧")
    }
}
