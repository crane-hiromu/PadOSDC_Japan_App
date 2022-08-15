import SwiftUI

// MARK: - Type
enum AppearanceMode: Int {
    case light
    case dark
    case auto
    
    static var `default`: Self = .dark
}

extension AppearanceMode {
    var colorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .auto:
            return nil
        }
    }
}

// MARK: - Optional Extension
extension Optional where Wrapped == ColorScheme {
    var appearanceMode: AppearanceMode {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return .auto
        }
    }
}
