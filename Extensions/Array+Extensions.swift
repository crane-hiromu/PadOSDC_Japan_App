import SwiftUI

/*
 AppStorageに配列を使用できるようにする拡張
 */

// MARK: - Array Extension
extension Array: RawRepresentable where Element: Codable {
    
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else { return nil }
        
        do {
            self = try JSONDecoder().decode([Element].self, from: data)
        } catch {
            self = []
        }
    }
    
    public var rawValue: String {
        do {
            let data = try JSONEncoder().encode(self)
            let result = String(data: data, encoding: .utf8)
            return result ?? defaultRawValue
        } catch {
            return defaultRawValue
        }
    }
    
    private var defaultRawValue: String {
        "[]"
    }
}
