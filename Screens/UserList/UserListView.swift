import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        ScrollView {
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
        .frame(maxWidth: .infinity)
        .background(.black)
        .navigationBarTitle(viewModel.output.title, displayMode: .inline)
        .onReceive(viewModel.output.openSns) {
            UIApplication.shared.open($0)
        }
    }
}
