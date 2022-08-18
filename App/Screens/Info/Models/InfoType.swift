import SwiftUI

// MARK: - Type
enum InfoType {
    case appearance, language
    case about, staff, speaker, blog, code, privacyPolicy
    
    private var key: String {
        switch self {
        case .appearance: return "Info_Type_Appearance"
        case .language: return "Info_Type_Language"
        case .about: return "Info_Type_About"
        case .staff: return "Info_Type_Staff"
        case .speaker: return "Info_Type_Speaker"
        case .blog: return "Info_Type_Blog"
        case .code: return "Info_Type_Source"
        case .privacyPolicy: return "Info_Type_Privacy"
        }
    }
    
    var label: String {
        NSLocalizedString(key, comment: "")
    }
    
    var icon: String {
        switch self {
        case .appearance: return "moon.circle"
        case .language: return "character.book.closed.hi"
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
        case .appearance: return nil
        case .language: return UIApplication.openSettingsURLString
        case .about: return Constants.iosdcUrl
        case .staff: return nil
        case .speaker: return nil
        case .blog: return Constants.blogUrl
        case .code: return Constants.github
        case .privacyPolicy: return Constants.privacyPolicyUrl
        }
    }
}
