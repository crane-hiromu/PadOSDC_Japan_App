import SwiftUI

// MARK: - View
struct LicenseView: View {
    @ObservedObject var viewModel: LicenseViewModel
    let environment: LicenseEnvironment

    var body: some View {
        List(viewModel.output.models, id: \.id) {
            LicenseRow(
                name: $0.name,
                destination: environment.router.routeToLicenseDetail(with: $0)
            )
        }
        .navigationBarTitle(L10n.infoTypeLicense, displayMode: .inline)
    }
}
