import SwiftUI
import SwiftUIWorkaround

// MARK: - View
struct InfoView: View {
    @ObservedObject var viewModel: InfoViewModel
    let environment: InfoEnvironment
    
    var body: some View {
        NavigationView {
            ScrollView { infoListView }
                .toolbar { closeToolbarContent }
                .frame(maxWidth: .infinity)
                .navigationBarTitle("Infomation", displayMode: .inline)
        }
        .onReceive(viewModel.output.openSns) {
            environment.router.routeToSns(with: $0)
        }
        .onReceive(viewModel.output.dismissView) {
            environment.dismiss()
        }
        .accentColor(.gray)
        .workaround.preferredAppearanceMode(viewModel.binding.$appearanceMode)
    }
}

// MARK: - Private View
private extension InfoView {
    
    var infoListView: some View {
        LazyVStack(spacing: 8) {
            InfoNavigationRow(
                type: .appearance,
                destination: appearanceView
            )
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
            InfoButtonRow(
                type: .code,
                action: { viewModel.input.didTapButton.send(.code) }
            )
            InfoButtonRow(
                type: .privacyPolicy,
                action: { viewModel.input.didTapButton.send(.privacyPolicy) }
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
    
    var appearanceView: some View {
        environment.router.routeToAppearanceSettings()
    }
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
}
