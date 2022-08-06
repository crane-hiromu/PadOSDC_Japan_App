import Foundation

struct SessionUser {
    let icon: URL?
    let name: String
    let twURL: URL?
    
    init(icon: URL? = nil, name: String, twURL: URL? = nil) {
        self.icon = icon
        self.name = name
        self.twURL = twURL
    }
}
