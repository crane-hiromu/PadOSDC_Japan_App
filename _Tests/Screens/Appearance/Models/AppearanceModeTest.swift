#if TESTING_ENABLED
import PlaygroundTester
import SwiftUI

// MARK: - Test
@objcMembers
final class AppearanceModeTest: TestCase {

    func testColorScheme() {
        AssertEqual(AppearanceMode.light.colorScheme, other: .light)
        AssertEqual(AppearanceMode.dark.colorScheme, other: .dark)
        AssertNil(AppearanceMode.auto.colorScheme)
    }
    
    func testAppearanceMode() {
        // type is .light
        do {
            var colorScheme: ColorScheme?
            colorScheme = .light
            AssertEqual(colorScheme.appearanceMode, other: .light)
        }
        
        // type is .dark
        do {
            var colorScheme: ColorScheme?
            colorScheme = .dark
            AssertEqual(colorScheme.appearanceMode, other: .dark)
        }
        
        // type is nil
        do {
            var colorScheme: ColorScheme?
            colorScheme = nil
            AssertEqual(colorScheme.appearanceMode, other: .auto)
        }
    }
}

#endif
