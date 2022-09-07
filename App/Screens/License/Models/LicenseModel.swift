import SwiftUI

// MARK: - Model
final class LicenseModel {
    let name: String
    let description: String
    
    init(
        name: String,
        plist: [[String: Any]]
    ) {
        self.name = name.replaceExtension
        self.description = plist.compactMap { 
            $0["FooterText"] as? String 
        }.first ?? ""
    }
}

// MARK: - Identifiable
extension LicenseModel: Identifiable {
    var id: UUID { UUID() }
}

/* fixme: いずれ stenceil ファイル側で制御する */
private extension String {
    
    var replaceExtension: String {
        replacingOccurrences(of: ".plist", with: "")
    }
}
