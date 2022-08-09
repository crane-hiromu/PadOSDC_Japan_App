import Foundation

enum Constants {
    static let twitterBaseUrl = "https://twitter.com"
    
    static let allSessions: [SessionModel] = [
        SessionDay0Type.allCases.flatMap { $0.models }
        + SessionDay1Type.allCases.flatMap { $0.models }
        + SessionDay2Type.allCases.flatMap { $0.models }
    ].flatMap { $0 }.filter { $0.user != nil }
}
