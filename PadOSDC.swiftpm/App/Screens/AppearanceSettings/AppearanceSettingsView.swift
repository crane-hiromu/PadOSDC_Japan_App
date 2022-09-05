import SwiftUI

// MARK: - View
struct AppearanceSettingsView: View {
    @ObservedObject var viewModel: AppearanceSettingsViewModel
    let environment: AppearanceSettingsEnvironment
    
    var body: some View {
        List {
            Picker(selection: $viewModel.binding.appearanceMode) {
                Text(L10n.appearanceSettingsPickerLight).tag(AppearanceMode.light)
                Text(L10n.appearanceSettingsPickerDark).tag(AppearanceMode.dark)
                Text(L10n.appearanceSettingsPickerAutomatic).tag(AppearanceMode.auto)
            } label: {
                // NOP
            }.pickerStyle(.inline)
        }
        .navigationBarTitle(L10n.appearanceSettingsNavTitle, displayMode: .inline)
    }
}
