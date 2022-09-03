import SwiftUI

// MARK: - Type
enum InfoType {
    case appearance, language
    case about, map, staff, speaker, blog, code, privacyPolicy, license
    
    var label: String {
        switch self {
        case .appearance: return L10n.infoTypeAppearance
        case .language: return L10n.infoTypeLanguage
        case .map: return L10n.infoTypeMap
        case .about: return L10n.infoTypeAbout
        case .staff: return L10n.infoTypeStaff
        case .speaker: return L10n.infoTypeSpeaker
        case .blog: return L10n.infoTypeBlog
        case .code: return L10n.infoTypeSource
        case .privacyPolicy: return L10n.infoTypePrivacy
        case .license: return L10n.infoTypeLicense
        }
    }
    
    var icon: String {
        switch self {
        case .appearance: return "moon.circle"
        case .language: return "character.book.closed.hi"
        case .map: return "mappin.and.ellipse"
        case .about: return "smiley"
        case .staff: return "person.crop.rectangle.stack"
        case .speaker: return "swift"
        case .blog: return "magazine"
        case .code: return "ellipsis.curlybraces"
        case .privacyPolicy: return "eye"
        case .license: return "list.bullet.rectangle"
        }
    }
    
    var url: String? {
        switch self {
        case .appearance: return nil
        case .language: return UIApplication.openSettingsURLString
        case .map: return nil
        case .about: return Constants.iosdcUrl
        case .staff: return nil
        case .speaker: return nil
        case .blog: return Constants.blogUrl
        case .code: return Constants.github
        case .privacyPolicy: return Constants.privacyPolicyUrl
        case .license: return nil
        }
    }
}
