import SwiftUI

// MARK: - Type
enum InfoType {
    case about, staff, speaker, blog, privacyPolicy
    
    var label: String {
        switch self {
        case .about: return "About"
        case .staff: return "Staff"
        case .speaker: return "Speaker"
        case .blog: return "Blog"
        case .privacyPolicy: return "Privacy Policy"
        }
    }
    
    var icon: String {
        switch self {
        case .about: return "smiley"
        case .staff: return "person.crop.rectangle.stack"
        case .speaker: return "swift"
        case .blog: return "magazine"
        case .privacyPolicy: return "eye"
        }
    }
    
    var url: String? {
        switch self {
        case .about: return Constants.iosdcUrl
        case .staff: return nil
        case .speaker: return nil
        case .blog: return Constants.blogUrl
        case .privacyPolicy: return Constants.privacyPolicyUrl
        }
    }
}
