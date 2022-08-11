import SwiftUI

enum InfoType {
    case about, staff, speaker, blog
    
    var label: String {
        switch self {
        case .about: return "About"
        case .staff: return "Staff"
        case .speaker: return "Speaker"
        case .blog: return "Blog"
        }
    }
    
    var icon: String {
        switch self {
        case .about: return "smiley"
        case .staff: return "person.crop.rectangle.stack"
        case .speaker: return "swift"
        case .blog: return "magazine"
        }
    }
    
    var url: String? {
        switch self {
        case .about: return "https://iosdc.jp/2022/"
        case .staff: return nil
        case .speaker: return nil
        case .blog: return "https://blog.iosdc.jp/"
        }
    }
}
