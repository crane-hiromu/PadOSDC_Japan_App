import Foundation

// MARK: - Type
enum TrackType: String, CaseIterable {
    case a, b, c, d, e
    
    var name: String {
        "\(L10n.sessionRowTagTrack) \(rawValue.uppercased())"
    }
}
