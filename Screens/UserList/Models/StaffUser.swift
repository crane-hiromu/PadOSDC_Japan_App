import SwiftUI

// MARK: - Model
struct StaffUser: User {
    let id = UUID()
    let icon: String?
    let name: String
    let twAccount: String?
    
    init(icon: String? = nil, name: String, twAccount: String? = nil) {
        self.icon = icon
        self.name = name
        self.twAccount = twAccount
    }
}

/*
 画像名とCaseを一致させている都合で`SessionUser`と重複しないように500番代から始める 
 */

// MARK: - Type
enum StaffUserType: String, CaseIterable {
    case user501, user502, user503, user504, user505,
         user506, user507, user508, user509, user510, 
         user511, user512, user513, user514, user515,
         user516, user517, user518, user519, user520,
         user521
    
    private var name: String {
        switch self {
        case .user501: return "tomzoh"
        case .user502: return "akatsuki174"
        case .user503: return "青ごへいもち"
        case .user504: return "h1d3mun3"
        case .user505: return "hamaco"
        case .user506: return "huin"
        case .user507: return "isaoeka"
        case .user508: return "iwai"
        case .user509: return "kaga"
        case .user510: return "kiwi"
        case .user511: return "Naoki"
        case .user512: return "qmihara"
        case .user513: return "rela1470"
        case .user514: return "roo"
        case .user515: return "ry-itto"
        case .user516: return "shiz"
        case .user517: return "sohichiro"
        case .user518: return "soranakk"
        case .user519: return "Tanaka Ryoga"
        case .user520: return "きくもと"
        case .user521: return "ころころ"
        }
    }
    
    private var twAccount: String? {
        switch self {
        case .user501: return "tomzoh"
        case .user502: return "akatsuki174"
        case .user503: return "blue_goheimochi"
        case .user504: return "h1d3mun3"
        case .user505: return "hamaco"
        case .user506: return "huin"
        case .user507: return "isaoeka"
        case .user508: return "RyIw1"
        case .user509: return "TAKA_0411"
        case .user510: return "koga_wiwi"
        case .user511: return "naoki_mrmt"
        case .user512: return "qmihara"
        case .user513: return "rela1470"
        case .user514: return "yue_roo"
        case .user515: return "ry_itto"
        case .user516: return "stzn3"
        case .user517: return "sohichiro"
        case .user518: return "soranakk"
        case .user519: return "treastrain"
        case .user520: return "takakiku"
        case .user521: return "corori_22"
        }
    }
    
    var user: StaffUser {
        .init(
            icon: rawValue,
            name: name,
            twAccount: twAccount
        )
    }
}
