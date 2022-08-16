#if TESTING_ENABLED

import PlaygroundTester
import Foundation

// MARK: - Test
@objcMembers
final class AppearanceSettingsViewModelTest: TestCase {
    
    // MARK: Property
    
    private let userDefaults: UserDefaults = .init(suiteName: "test") ?? .standard
    
    // MARK: Test
    
    func testAppearanceMode() {
        // type: .light
        do {
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .light,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .light)
        }
        
        // type: .dark
        do {
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .dark,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .dark)
        }
        
        // type: .auto
        do {
            let viewModel = AppearanceSettingsViewModel(binding: .init(
                appearanceMode: .auto,
                userDefaults: userDefaults
            ))
            AssertEqual(viewModel.binding.appearanceMode, other: .auto)
        }
    }
}

#endif
