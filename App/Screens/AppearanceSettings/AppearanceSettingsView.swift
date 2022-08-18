import SwiftUI

// MARK: - View
struct AppearanceSettingsView: View {
    @ObservedObject var viewModel: AppearanceSettingsViewModel
    let environment: AppearanceSettingsEnvironment
    
    var body: some View {
        List {
            Picker(selection: $viewModel.binding.appearanceMode) {
                Text("AppearanceSettings_Picker_Light").tag(AppearanceMode.light)
                Text("AppearanceSettings_Picker_Dark").tag(AppearanceMode.dark)
                Text("AppearanceSettings_Picker_Automatic").tag(AppearanceMode.auto)
            } label: {
                // NOP
            }.pickerStyle(.inline)
        }
        .navigationBarTitle(Text("AppearanceSettings_Nav_Title"), displayMode: .inline)
    }
}
