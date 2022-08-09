import Foundation
import SwiftUI

// MARK: - Model

struct SessionUser {
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

extension SessionUser: Hashable {
    
    static func == (lhs: SessionUser, rhs: SessionUser) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

// MARK: - Type

enum SessionUserType: String, CaseIterable {
    case user1, user2, user3, user4, user5, 
         user6, user7, user8, user9, user10,
         user11, user12, user13, user14, user15, 
         user16, user17, user18, user19, user20,
         user21, user22, user23, user24, user25, 
         user26, user27, user28, user29, user30,
         user31, user32, user33, user34, user35,
         user36, user37, user38, user39, user40,
         user41, user42, user43, user44, user45,
         user46, user47, user48, user49, user50,
         user52, user53, user54, user55,
         user56, user57, user58, user59, user60,
         user61, user62, user63, user64, user65,
         user66, user67, user68, user69, user70,
         user71, user72, user73, user74, user75,
         user76, user77, user78, user79, user80,
         user81, user82, user83, user84, user85,
         user86, user87,         user89, user90,
         user91, user92, user93, user94, user95
    
    
    private var name: String {
        switch self {
        case .user1: return "かっくん"
        case .user2: return "あつや"
        case .user3: return "Naoyuki Murata"
        case .user4: return "Shinya Todaka"
        case .user5: return "uhooi"
        case .user6: return "千吉良 成紀"
        case .user7: return "すぎー"
        case .user8: return "アイカワ"
        case .user9: return "宇佐見 公輔"
        case .user10: return "くろるり"
        case .user11: return "堤 修一"
        case .user12: return "吉田悠一"
        case .user13: return "木下郁英"
        case .user14: return "inokinn"
        case .user15: return "REON"
        case .user16: return "Adam Henry"
        case .user17: return "日向強"
        case .user18: return "matsue"
        case .user19: return "アンドレカンドレ"
        case .user20: return "新井 美香"
        case .user21: return "倉井 龍太郎"
        case .user22: return "岸川克己"
        case .user23: return "shiz"
        case .user24: return "稲見 泰宏"
        case .user25: return "服部 智"
        case .user26: return "HEAVEN chan / ikkou"
        case .user27: return "Yusuke Ohashi"
        case .user28: return "新田 陸"
        case .user29: return "ShogoSaito"
        case .user30: return "久利龍義"
        case .user31: return "ainame"
        case .user32: return "noppe"
        case .user33: return "ぼぶ"
        case .user34: return "monoqlo"
        case .user35: return "ばんじゅん🍓"
        case .user36: return "entaku"
        case .user37: return "Yosuke Imairi"
        case .user38: return "treastrain / Tanaka Ryoga"
        case .user39: return "Apurin Mikhail"
        case .user40: return "ta_ka_tsu"
        case .user41: return "Roku"
        case .user42: return "tsuboyan"
        case .user43: return "リルオッサ"
        case .user44: return "赤田　進（Sam Akada）"
        case .user45: return "大庭 慎一郎"
        case .user46: return "freddi"
        case .user47: return "ShoMasegi"
        case .user48: return "杉本 至"
        case .user49: return "Yutaro Muta"
        case .user50: return "所友太"
        case .user52: return "大塚 悠貴"
        case .user53: return "motoshima1150"
        case .user54: return "川辺 裕太、石井 潤"
        case .user55: return "Izu"
        case .user56: return "Yoshimasa Niwa"
        case .user57: return "増住 啓吾"
        case .user58: return "伊賀 裕展"
        case .user59: return "oishi"
        case .user60: return "今泉智博"
        case .user61: return "あおい"
        case .user62: return "Hiromu Tsuruta"
        case .user63: return "續橋　涼"
        case .user64: return "たまねぎ"
        case .user65: return "Ogijun"
        case .user66: return "izumi"
        case .user67: return "1024jp"
        case .user68: return "jollyjoester"
        case .user69: return "nade"
        case .user70: return "Giuk Jung"
        case .user71: return "かしはら"
        case .user72: return "佐藤 光"
        case .user73: return "Yuta Koshizawa"
        case .user74: return "shimastripe"
        case .user75: return "kateinoigakukun"
        case .user76: return "ああうえ"
        case .user77: return "Yuji Fujisaka"
        case .user78: return "nagain"
        case .user79: return "まつじ"
        case .user80: return "岩名 勇輝"
        case .user81: return "yamannnu"
        case .user82: return "なめき　ちはる"
        case .user83: return "darquro"
        case .user84: return "haseken"
        case .user85: return "Hiroshi Shikata"
        case .user86: return "akatsuki174"
        case .user87: return "Park Byungjun"
        case .user89: return "FromAtom"
        case .user90: return "kntkymt"
        case .user91: return "しもとり"
        case .user92: return "marty-suzuki"
        case .user93: return "AkkeyLab"
        case .user94: return "くどかい"
        case .user95: return "立花和也"
        }
    }
    
    private var twAccount: String? {
        switch self {
        case .user1: return "fromkk"
        case .user2: return "n_atmark"
        case .user3: return "namu767676"
        case .user4: return "shinya_todaka"
        case .user5: return "the_uhooi"
        case .user6: return "_naru_jpn"
        case .user7: return "u5_03"
        case .user8: return "kalupas226"
        case .user9: return "usamik26"
        case .user10: return "kuroruri"
        case .user11: return "shu223"
        case .user12: return "sonson_twit"
        case .user13: return "i_kinopee"
        case .user14: return "inokinn"
        case .user15: return "reon_ios_cat"
        case .user16: return "monolithic_adam"
        case .user17: return "coffeegyunyu"
        case .user18: return "base_front"
        case .user19: return "andrekandore"
        case .user20: return "satsukiasa"
        case .user21: return "kurain"
        case .user22: return "k_katsumi"
        case .user23: return "stzn3"
        case .user24: return "inamiy"
        case .user25: return "shmdevelop"
        case .user26: return "ikkou"
        case .user27: return "junkpiano"
        case .user28: return "hal8563"
        case .user29: return "GoS_67"
        case .user30: return "kuritatu18"
        case .user31: return "ainame"
        case .user32: return "noppefoxwolf"
        case .user33: return "BOBG1018Vi"
        case .user34: return "monoqlo"
        case .user35: return "banjun"
        case .user36: return "entaku_0818"
        case .user37: return "kamekiti"
        case .user38: return "treastrain"
        case .user39: return "auramagi"
        case .user40: return "ta_ka_tsu"
        case .user41: return "66nylon_y"
        case .user42: return "tsuboyan5"
        case .user43: return "littleossa"
        case .user44: return "sam_akada"
        case .user45: return "ooba"
        case .user46: return "___freddi___"
        case .user47: return "boc_sho"
        case .user48: return "itaru_sugimoto"
        case .user49: return "yutailang0119"
        case .user50: return "tokorom"
        case .user52: return "moguaiyuki"
        case .user53: return nil
        case .user54: return nil
        case .user55: return nil
        case .user56: return "niw"
        case .user57: return nil
        case .user58: return "iganin_dev"
        case .user59: return "oishi"
        case .user60: return "imaizume"
        case .user61: return "aomathwift"
        case .user62: return "hcrane14"
        case .user63: return "tsuzuki817"
        case .user64: return "_chocoyama"
        case .user65: return "juginon"
        case .user66: return "rizumi_jp"
        case .user67: return "1024jp"
        case .user68: return "jollyjoester"
        case .user69: return "kazuma_nagano"
        case .user70: return nil
        case .user71: return "kashihararara"
        case .user72: return "hicka04"
        case .user73: return "koher"
        case .user74: return "shimastriper"
        case .user75: return "kateinoigakukun"
        case .user76: return "_kwzr_"
        case .user77: return "yujif_"
        case .user78: return "na9ain"
        case .user79: return "mtj_j"
        case .user80: return "_rockname"
        case .user81: return "_yamannnu"
        case .user82: return "Ridwy"
        case .user83: return "darquro"
        case .user84: return "haseken_dev"
        case .user85: return "dotrikun"
        case .user86: return "akatsuki174"
        case .user87: return "hexarf"
        case .user89: return "FromAtom"
        case .user90: return "kntk47502405"
        case .user91: return "S_Shimotori_pub"
        case .user92: return "marty_suzuki"
        case .user93: return "AkkeyLab"
        case .user94: return "kudokai00"
        case .user95: return "kzytcbn315"
        }
    }
    
    var user: SessionUser {
        .init(
            icon: twAccount == nil ? nil : rawValue,
            name: name,
            twAccount: twAccount
        )
    }
}
