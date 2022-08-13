import SwiftUI

// MARK: - View
struct InfoView: View {
    let viewModel: InfoViewModel
    let environment: InfoEnvironment
    
    var body: some View {
        NavigationView {
            ScrollView { infoListView }
                .toolbar { closeToolbarContent }
                .frame(maxWidth: .infinity)
                .background(.black)
                .navigationBarTitle("Infomation", displayMode: .inline)
        }
        .onReceive(viewModel.output.openSns) {
            environment.router.routeToSns(with: $0)
        }
        .onReceive(viewModel.output.dismissView) {
            environment.dismiss()
        }
        .accentColor(.gray)
    }
}

// MARK: - Private View
private extension InfoView {
    
    var infoListView: some View {
        LazyVStack(spacing: 8) {
            InfoButtonRow(
                type: .about,
                action: { viewModel.input.didTapButton.send(.about) }
            )
            InfoNavigationRow(
                type: .staff,
                destination: staffListView
            )
            InfoNavigationRow(
                type: .speaker,
                destination: speakerListView
            )
            InfoButtonRow(
                type: .blog,
                action: { viewModel.input.didTapButton.send(.blog) }
            )
            Spacer()
        }
        .padding()
    }
    
    var staffListView: UserListView {
        environment.router.routeToUserList(
            with: StaffUserType.allCases.map(\.user)
        )
    }
    
    var speakerListView: UserListView {
        environment.router.routeToUserList(
            with: SessionUserType.allCases.map(\.user).sorted { $0.name < $1.name }
        )
    }
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
}
