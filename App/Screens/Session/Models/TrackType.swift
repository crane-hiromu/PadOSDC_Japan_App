import Foundation

// MARK: - Type
enum TrackType: String, CaseIterable {
    case a, b, c, d, e
    
    private var track: String {
        NSLocalizedString("Session_Row_Tag_Track", comment: "")
    }
    
    var name: String {
        "\(track) \(rawValue.uppercased())"
    }
}
