import SwiftUI

// MARK: - Protocol
protocol RouterProtocol {
    // View
    static func routeToRoot() -> RootView
    static func routeToSession(with scheduleType: ScheduleType) -> SessionView
    static func routeToSessionList() -> SessionListView
    static func routeToInfo() -> InfoView
    static func routeToAppearanceSettings() -> AppearanceSettingsView
    static func routeToMap() -> MapView
    static func routeToSessionDetail(with model: SessionModel) -> SessionDetailView
    static func routeToUserList(with models: [User]) -> UserListView
    static func routeToLicense() -> LicenseView
    static func routeToLicenseDetail(with model: LicenseModel) -> LicenseDetailView
    static func routeToStaffType() -> StaffTypeView
    // Web
    static func routeToWeb(with url: URL)
}

// MARK: - Router
enum Router: RouterProtocol {
    
    // MARK: View
    
    static func routeToRoot() -> RootView {
        .init(
            viewModel: .init(),
            environment: .init()
        )
    }
    
    static func routeToSession(with scheduleType: ScheduleType) -> SessionView {
        .init(
            viewModel: .init(
                output: .init(scheduleType: scheduleType), 
                binding: .init(scheduleType: scheduleType)
            ), 
            environment: .init()
        )
    }
    
    static func routeToSessionList() -> SessionListView {
        .init(
            viewModel: .init(),
            environment: .init()
        )
    }
    
    static func routeToInfo() -> InfoView {
        .init(
            viewModel: .init(),
            environment: .init()
        )
    }
    
    static func routeToAppearanceSettings() -> AppearanceSettingsView {
        .init(
            viewModel: .init(),
            environment: .init()
        )
    }
    
    static func routeToMap() -> MapView {
        .init(viewModel: .init())
    }
    
    static func routeToSessionDetail(with model: SessionModel) -> SessionDetailView {
        .init(
            viewModel: .init(output: .init(model: model)), 
            environment: .init()
        )
    }
    
    static func routeToUserList(with models: [User]) -> UserListView {
        .init(
            viewModel: .init(output: .init(models: models)), 
            environment: .init()
        )
    }
    
    static func routeToLicense() -> LicenseView {
        .init(viewModel: .init(), environment: .init())
    }
    
    static func routeToLicenseDetail(with model: LicenseModel) -> LicenseDetailView {
        .init(
            viewModel: .init(
                output: .init(model: model)
            )
        )
    }
    
    static func routeToStaffType() -> StaffTypeView {
        .init(environment: .init())
    }
    
    // MARK: Web
    
    static func routeToWeb(with url: URL) {
        UIApplication.shared.open(url)
    }
}

// MARK: - Internal Extension
extension EnvironmentValues {
    
    private struct RouterProtocolKey: EnvironmentKey {
        static var defaultValue: RouterProtocol.Type = Router.self
    }
    
    var router: RouterProtocol.Type {
        get { self[RouterProtocolKey.self] }
        set { self[RouterProtocolKey.self] = newValue }
    }
}
