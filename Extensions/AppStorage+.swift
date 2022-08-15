import SwiftUI

// MARK: - Key
enum AppStorageKey: String {
    case appearanceMode
}

// MARK: - Extension
extension AppStorage {
    
    init(
        wrappedValue: Value, 
        _ key: AppStorageKey,
        store: UserDefaults? = nil
    ) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}
