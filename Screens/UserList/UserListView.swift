import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    
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
                .padding(.all, 4)
                .background(Color.secondarySystemBackground)
                .cornerRadius(12)
            }
            .padding(.all, 16)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .navigationBarTitle("Speaker", displayMode: .inline)
        .onReceive(viewModel.output.openSns) {
            UIApplication.shared.open($0)
        }
    }
}
