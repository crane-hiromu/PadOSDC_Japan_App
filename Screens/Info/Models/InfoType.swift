import SwiftUI

// MARK: - Type
enum InfoType {
    case about, staff, speaker, blog, code, privacyPolicy
    
    var label: String {
        switch self {
        case .about: return "About"
        case .staff: return "Staff"
        case .speaker: return "Speaker"
        case .blog: return "Blog"
        case .code: return "Source code"
        case .privacyPolicy: return "Privacy Policy"
        }
    }
    
    var icon: String {
        switch self {
        case .about: return "smiley"
        case .staff: return "person.crop.rectangle.stack"
        case .speaker: return "swift"
        case .blog: return "magazine"
        case .code: return "ellipsis.curlybraces"
        case .privacyPolicy: return "eye"
        }
    }
    
    var url: String? {
        switch self {
        case .about: return Constants.iosdcUrl
        case .staff: return nil
        case .speaker: return nil
        case .blog: return Constants.blogUrl
        case .code: return Constants.github
        case .privacyPolicy: return Constants.privacyPolicyUrl
        }
    }
}
