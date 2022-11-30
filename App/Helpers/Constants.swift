import Foundation

// MARK: - Constants
enum Constants {
    // MARK: URL
    static let twitterBaseUrl = "https://twitter.com"
    static let youtubeBaseUrl = "https://www.youtube.com/watch?v="
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
}
