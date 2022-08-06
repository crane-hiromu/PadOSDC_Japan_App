import Foundation

// MARK: - SessionType Protocol

protocol SessionType {
    var id: UUID { get }
    var time: String { get }
    var models: [SessionModel] { get }
}

extension SessionType {
    var id: UUID { .init() }
}

// MARK: - SessionType

enum SessionDay1Type: Int, CaseIterable, SessionType {
    case t1620_1635, t1640_1700, t1715_1755, t1810_1830, t1845_1905, t1920_1940, t1950_2000
    
    var time: String {
        switch self {
        case .t1620_1635: return "16:20~16:35"
        case .t1640_1700: return "16:40~17:00"
        case .t1715_1755: return "17:15~17:55"
        case .t1810_1830: return "18:10~18:30"
        case .t1845_1905: return "18:45~19:05"
        case .t1920_1940: return "19:20~19:40"
        case .t1950_2000: return "19:50~20:00"
        }
    }
    
    var models: [SessionModel] { 
        switch self {
        case .t1620_1635: 
            return [
                .init(track: .a,
                      title: "前夜祭説明")
            ]
        case .t1640_1700: 
            return [
                .init(track: .a, 
                      title: "ノートアプリのテキストエディタの解体新書",
                      description: "note の iOS アプリのテキストエディタはテキストや画像、埋め込みなど様々な要素を入力できます。\nまた、今年には V4 エディタと呼んでいるエディタの拡張も行い、箇条書きや罫線などのサポートも追加しました。\nスクロールする画面に複数の UITextView を入れる UI を作る時に、みなさんはどのように設計するでしょうか？\nnote の iOS アプリでは伸び縮みする画面を作る方法として、UIScrollView の中に UIStackView を入れて、その中に UITextView を含むビューを配置するように実装しました。\nこのセッションでは UIKit を活用して、伸び縮みするような画面を作る際の考え方と実装する際に困ったことなどをお話しします。", 
                      user: .init(name: "かっくん")),
                .init(track: .b, 
                      title: "施策基盤としてのディープリンク 〜なめらかにアプリが開く体験のために〜 ",
                      description: "SNSにおけるプロモーションや、Webのユーザーをアプリユーザーに転換させるような施策を実施したい場合にディープリンクを利用したいケースはよくあるでしょう。\n\nディープリンクを利用してユーザーをアプリに連れてくる際「ユーザーが文脈を理解できている状態」というのは重要で、ユーザー状態に応じたフローを組むだけでは施策の効果を十分に発揮できない可能性があります。\n\nこのセッションでは、滑らかな体験でアプリにユーザーを連れてくるために「ディープリンク」を効果的に活用する方法やその仕組みについて紹介します。\n\n話すトピック\n・概念としてのディープリンクおよび、ディープリンクを実現するための機能紹介\n・アプリのインストール状況や初回設定状況などのユーザー状態に応じた適切な遷移方法\n・ユーザーに文脈を理解した状態のままアプリに来てもらうために活用できる仕組み\n・コンバージョンの計測方法",
                      user: .init(name: "あつや")),
                .init(track: .c, 
                      title: "ShazamKitの遊び方",
                      description: "WWDC2021で発表されたShazamKitは、膨大な音楽カタログをベースに何百万曲の音楽検索を行える音声認識フレームワークです。\n音楽に全く詳しくない私(ミスチル好き)ですが音声認識機能には興味があり、レンタルスペースを予約できる「SpaceMarket」のiOS/Androidアプリへ遊びで勝手に組み込んでみたので\n・ShazamKitの機能紹介\n・両OSへの導入の仕方\n・使い道の検討/実際に作ってみた機能/社員の反応\nについてお伝えできればと思っています。", 
                      user: .init(name: "Naoyuki Murata")),
                .init(track: .d, 
                      title: "iPhoneのセンサで”位置情報”を得るために",
                      description: "みなさんiPhoneのセンサで取得できる位置情報と聞いて何を思い浮かべますか？\nおそらくCore Location Frameworkを使った緯度経度情報を思い浮かべる方が多いのではないでしょうか。\nロボット開発の観点では自己位置推定と呼ばれるLiDAR,カメラ,加速度センサなどを組み合わせることによってロボットの位置を推定する技術が日々研究されています。\n本トークでは位置情報を得るという目的のためにiPhoneのセンサを使って検証した結果を\n\n・どのようなセンサを使う方法があるか\n・取得できる位置情報の精度\n\nについて紹介します。", 
                      user: .init(name: "Shinya Todaka"))
            ]
        case .t1715_1755: 
            return [
                .init(track: .a,
                      title: "ウーニャ、しってる。みんなふんいきでSwiftUIをつかってる",
                      description: nil,
                      user: .init(name: "uhooi")),
                .init(track: .b,
                      title: "PiPを応用した配信コメントバー機能の開発秘話と技術の詳解",
                      description: nil,
                      user: .init(name: "千吉良 成紀")),
                .init(track: .c,
                      title: "Swiftで我が家をより便利に、安全に！ ",
                      description: nil,
                      user: .init(name: "すぎー")),
                .init(track: .d,
                      title: "SwiftUI Navigation のすべて",
                      description: nil,
                      user: .init(name: "アイカワ"))
            ]
        case .t1810_1830:
            return [
                .init(track: .a,
                      title: "SwiftPMのプラグイン機能をiOSアプリ開発に活用する",
                      description: nil,
                      user: .init(name: "宇佐見 公輔")),
                .init(track: .b,
                      title: "CICD構築・自動化入門",
                      description: nil,
                      user: .init(name: "くろるり")),
                .init(track: .c,
                      title: "MLOps for Core ML",
                      description: nil,
                      user: .init(name: "堤 修一")),
                .init(track: .d,
                      title: "Dive into Mac Catalyst",
                      description: nil,
                      user: .init(name: "吉田悠一")),
                .init(track: .e,
                      title: "PWAの今とこれから、iOSでの対応状況",
                      description: nil,
                      user: .init(name: "木下郁英"))
            ]
        case .t1845_1905:
            return [
                .init(track: .a,
                      title: "20分間で振り返るIn-App Purchaseの歴史",
                      description: nil,
                      user: .init(name: "inokinn")),
                .init(track: .b,
                      title: "量子情報工学への招待 〜iOSアプリ開発を通して学んでみよう〜",
                      description: nil,
                      user: .init(name: "REON")),
                .init(track: .c,
                      title: "ChaChaPoly and You, CryptoKit Explained",
                      description: nil,
                      user: .init(name: "Adam Henry")),
                .init(track: .d,
                      title: "令和時代のXML処理を考える 〜もしあなたが巨大なXMLと相見える(あいまみえる)ことになったら〜",
                      description: nil,
                      user: .init(name: "日向強")),
                .init(track: .e,
                      title: "広まれSafari Web Extensions！Safari Web Extensions の始め方",
                      description: nil,
                      user: .init(name: "matsue"))
            ]
        case .t1920_1940:
            return [
                .init(track: .c,
                      title: "「問題はソースコードではない！?」長生きするアプリの「品質低下」の謎",
                      description: nil,
                      user: .init(name: "アンドレカンドレ"),
                      isSponsor: true),
                .init(track: .d,
                      title: "2022年の新規アプリ開発で採用した技術",
                      description: nil,
                      user: .init(name: "新井 美香"),
                      isSponsor: true),
                .init(track: .e,
                      title: "メタバースを支えるエンジニアの生態について",
                      description: nil,
                      user: .init(name: "倉井 龍太郎"),
                      isSponsor: true)
            ]
        case .t1950_2000:
            return [
                .init(track: .a,
                      title: "Today's Update")
            ]
        }

    }
}

enum SessionDay2Type: Int, CaseIterable, SessionType {
    case t1000_1040, t1105_1145, t1200_1220, t1300_1320, t1335_1355, t1410_1450
    
    var time: String { return "" }
    var models: [SessionModel] { [] }
}

enum SessionDay3Type: Int, CaseIterable, SessionType {
    case t // todo
    
    var time: String { return "" }
    var models: [SessionModel] { [] }
}
