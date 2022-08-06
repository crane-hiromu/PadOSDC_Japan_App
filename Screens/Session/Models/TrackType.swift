import Foundation
import SwiftUI

enum TrackType: String, CaseIterable {
    case a, b, c, d, e
    
    var name: String {
        "Track \(rawValue.uppercased())"
    }
}
