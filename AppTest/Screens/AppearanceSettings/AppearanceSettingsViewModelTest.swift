#if TESTING_ENABLED

import PlaygroundTester
import Foundation

// MARK: - Test
@objcMembers
final class AppearanceSettingsViewModelTest: TestCase {
    
    func testAppearanceMode() {
        // type: .light
        do {
            let userDefaults: UserDefaults = .init(suiteName: "test_light") ?? .standard
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .light,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .light)
        }
        
        // type: .dark
        do {
            let userDefaults: UserDefaults = .init(suiteName: "test_dark") ?? .standard
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .dark,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .dark)
        }
        
        // type: .auto
        do {
            let userDefaults: UserDefaults = .init(suiteName: "test_auto") ?? .standard
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .auto,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .auto)
        }
    }
}

#endif
