import SwiftUI

// MARK: - View
struct LicenseView: View {
    @ObservedObject var viewModel: LicenseViewModel

    var body: some View {
        List(viewModel.output.models, id: \.self) { 
            Text($0.replaceExtension)
        }
        .navigationBarTitle(L10n.infoTypeLicense, displayMode: .inline)
    }
}

/* fixme: いずれ stenceil ファイル側で制御する */
private extension String {
    
    var replaceExtension: String {
        replacingOccurrences(of: ".plist", with: "")
    }
}
