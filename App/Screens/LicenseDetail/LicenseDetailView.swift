import SwiftUI

// MARK: - View
struct LicenseDetailView: View {
    @ObservedObject var viewModel: LicenseDetailViewModel
    
    var body: some View {
        ScrollView {
            Text(viewModel.output.model.description)
                .padding()
        }
        .navigationBarTitle(viewModel.output.model.name, displayMode: .inline)
    }
}
