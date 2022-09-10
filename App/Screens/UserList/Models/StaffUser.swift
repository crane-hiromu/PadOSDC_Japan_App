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
enum CoreStaffUserType: String, CaseIterable, UserType {
    case user501, user502, user503, user504, user505,
         user506, user507, user508, user509, user510, 
         user511, user512, user513, user514, user515,
         user516, user517, user518, user519, user520,
         user521, user522
    
    var name: String {
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
        case .user522: return "とうまつ"
        }
    }
    
    var twAccount: String? {
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
        case .user522: return "tomatsu2k"
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

/*
 画像名とCaseを一致させている都合で`SessionUser`と重複しないように600番代から始める 
 */

// MARK: - Type
enum TemporaryStaffUserType: String, CaseIterable, UserType {
    case user601, user602, user603, user604, user605,
         user606, user607, user608, user609, user610,
         user611, user612, user613, user614, user615
    
    var name: String {
        switch self {
        case .user601: return "CookieySun"
        case .user602: return "kagaffy"
        case .user603: return "kazu42"
        case .user604: return "Koji Torishima"
        case .user605: return "kotetu"
        case .user606: return "rerenote"
        case .user607: return "Ryota Hayashi"
        case .user608: return "soo"
        case .user609: return "sugiy"
        case .user610: return "Syunya Fujisawa"
        case .user611: return "オダギリ133"
        case .user612: return "けんだい"
        case .user613: return "ずんだまる"
        case .user614: return "ちはっぴー"
        case .user615: return "みずほちゃん"
        }
    }
    
    var twAccount: String? {
        switch self {
        case .user601: return "CookieySun"
        case .user602: return "kagaffy"
        case .user603: return "kazu-42"
        case .user604: return nil
        case .user605: return "kotetu"
        case .user606: return "rerenote"
        case .user607: return "yomoapp"
        case .user608: return "jigoo_dev"
        case .user609: return "u5_03"
        case .user610: return "syunyadesuyoros"
        case .user611: return "gurensouen"
        case .user612: return "Kendai"
        case .user613: return "zuncha318"
        case .user614: return "charlielog_ggg"
        case .user615: return nil
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

/*
 画像名とCaseを一致させている都合で`SessionUser`と重複しないように700番代から始める 
 */

// MARK: - Type
enum NetworkStaffUserType: String, CaseIterable, UserType {
    case user701, user702, user703, user704, user705
    
    var name: String {
        switch self {
        case .user701: return "shimastripe"
        case .user702: return "sugiken"
        case .user703: return "Zucchi"
        case .user704: return "しもとり"
        case .user705: return "とある鶴"
        }
    }
    
    var twAccount: String? {
        switch self {
        case .user701: return "shimastriper"
        case .user702: return "sugiken_jp"
        case .user703: return "E01I6"
        case .user704: return "S_Shimotori_pub"
        case .user705: return nil
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
