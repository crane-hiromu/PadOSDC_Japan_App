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
            InfoSection(title: L10n.infoSectionSetting)
            
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
            InfoSection(title: L10n.infoSectionInfomation)
            
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
                destination: staffTypeView
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
            InfoNavigationRow(
                type: .license,
                destination: licenseView
            )
        }
    }
    
    var appearanceView: AppearanceSettingsView {
        environment.router.routeToAppearanceSettings()
    }
    
    var mapView: MapView {
        environment.router.routeToMap()
    }
    
    var staffTypeView: StaffTypeView {
        environment.router.routeToStaffType()
    }
    
    var speakerListView: UserListView {
        environment.router.routeToUserList(
            with: SessionUserType.allCases.map(\.user).sorted { $0.name < $1.name }
        )
    }
    
    var licenseView: LicenseView {
        environment.router.routeToLicense()
    }
    
    var closeToolbarContent: CloseToolbarContent {
        .init { 
            viewModel.input.didTapClose.send(())
        }
    }
}
