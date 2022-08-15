import SwiftUI

// MARK: - View
struct AppearanceSettingsView: View {
    @ObservedObject var viewModel: AppearanceSettingsViewModel
    let environment: AppearanceSettingsEnvironment
    
    var body: some View {
        List {
            Picker(selection: $viewModel.binding.appearanceMode) {
                Text("ライト").tag(AppearanceMode.light)
                Text("ダーク").tag(AppearanceMode.dark)
                Text("自動").tag(AppearanceMode.auto)
            } label: {
                Text("外観モード")
            }.pickerStyle(.inline)
        }
        .navigationBarTitle("外観モード", displayMode: .inline)
    }
}
