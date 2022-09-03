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
                .navigationBarTitle("", displayMode: .inline)
        }
        .onReceive(viewModel.output.openSns) {
            environment.router.routeToWeb(with: $0)
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
        Group {
            settingListView
            infomationListView
            Spacer()
        }
        .padding()
    }
    
    var settingListView: some View {
        LazyVStack(spacing: 8) {
            InfoSection(key: "Info_Section_Setting")
            
            InfoNavigationRow(
                type: .appearance,
                destination: appearanceView
            )
            InfoButtonRow(
                type: .language,
                action: { viewModel.input.didTapButton.send(.language) }
            )
        }
    }
    
    var infomationListView: some View {
        LazyVStack(spacing: 8) {
            InfoSection(key: "Info_Section_Infomation")
            
            InfoButtonRow(
                type: .about,
                action: { viewModel.input.didTapButton.send(.about) }
            )
            InfoNavigationRow(
                type: .map,
                destination: mapView
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
        }
    }
    
    var mapView: MapView {
        environment.router.routeToMap()
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
