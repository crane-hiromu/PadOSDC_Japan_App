import Foundation

// MARK: - Constants
enum Constants {
    // MARK: URL
    static let twitterBaseUrl = "https://twitter.com"
    static let iosdcUrl = "https://iosdc.jp/2022/"
    static let blogUrl = "https://blog.iosdc.jp/"
    static let privacyPolicyUrl = "https://crane-hiromu.github.io/PadOSDC-iOS-App-Privacy-Policy.io/"
    static let github = "https://github.com/crane-hiromu/PadOSDC_Japan_App"
    
    // MARK: Language Type
    enum LanguageType: String {
        case en, ja
        
        static var current: LanguageType? {
            LanguageType(rawValue: Locale.current.languageCode ?? "")
        } 
    }
    
    // MARK: Resource Type
    enum ResourceType {
        case license
        
        private var fileName: String {
            switch self {
            case .license: return "license-list"
            }
        }
        
        private var fileExtension: String {
            switch self {
            case .license: return "plist"
            }
        }
        
        var fileURL: URL {
            Bundle.main.url(forResource: fileName, withExtension: fileExtension)!
        }
    }
}
