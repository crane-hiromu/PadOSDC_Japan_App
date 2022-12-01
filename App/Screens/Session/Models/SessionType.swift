import Foundation

// MARK: - SessionType Protocol
protocol SessionType {
    var id: UUID { get }
    var index: Int { get }
    var time: String { get }
    var models: [SessionModel] { get }
    static var models: [SessionModel] { get }
}

extension SessionType {
    var id: UUID { .init() }
}

// MARK: - SessionType 0
enum SessionDay0Type: Int, CaseIterable, SessionType {
    case t1620_1635,
         t1640_1700,
         t1715_1755,
         t1810_1830,
         t1845_1905,
         t1920_1940,
         t1950_2000
    
    var index: Int {
        rawValue
    }
    
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
                      description: "note の iOS アプリのテキストエディタはテキストや画像、埋め込みなど様々な要素を入力できます。\n\nまた、今年には V4 エディタと呼んでいるエディタの拡張も行い、箇条書きや罫線などのサポートも追加しました。\n\nスクロールする画面に複数の UITextView を入れる UI を作る時に、みなさんはどのように設計するでしょうか？\n\nnote の iOS アプリでは伸び縮みする画面を作る方法として、UIScrollView の中に UIStackView を入れて、その中に UITextView を含むビューを配置するように実装しました。\n\nこのセッションでは UIKit を活用して、伸び縮みするような画面を作る際の考え方と実装する際に困ったことなどをお話しします。",
                      user: SessionUserType.user1.user,
                      archiveParameter: "K3zqzeieGgY"),
                .init(track: .b,
                      title: "施策基盤としてのディープリンク 〜なめらかにアプリが開く体験のために〜 ",
                      description: "SNSにおけるプロモーションや、Webのユーザーをアプリユーザーに転換させるような施策を実施したい場合にディープリンクを利用したいケースはよくあるでしょう。\n\nディープリンクを利用してユーザーをアプリに連れてくる際「ユーザーが文脈を理解できている状態」というのは重要で、ユーザー状態に応じたフローを組むだけでは施策の効果を十分に発揮できない可能性があります。\n\nこのセッションでは、滑らかな体験でアプリにユーザーを連れてくるために「ディープリンク」を効果的に活用する方法やその仕組みについて紹介します。\n\n話すトピック\n・概念としてのディープリンクおよび、ディープリンクを実現するための機能紹介\n・アプリのインストール状況や初回設定状況などのユーザー状態に応じた適切な遷移方法\n・ユーザーに文脈を理解した状態のままアプリに来てもらうために活用できる仕組み\n・コンバージョンの計測方法",
                      user: SessionUserType.user2.user,
                      archiveParameter: "q-GGWgupxD8"),
                .init(track: .c,
                      title: "ShazamKitの遊び方",
                      description: "WWDC2021で発表されたShazamKitは、膨大な音楽カタログをベースに何百万曲の音楽検索を行える音声認識フレームワークです。\n\n音楽に全く詳しくない私(ミスチル好き)ですが音声認識機能には興味があり、レンタルスペースを予約できる「SpaceMarket」のiOS/Androidアプリへ遊びで勝手に組み込んでみたので\n\n・ShazamKitの機能紹介\n・両OSへの導入の仕方\n・使い道の検討/実際に作ってみた機能/社員の反応\n\nについてお伝えできればと思っています。",
                      user: SessionUserType.user3.user,
                      archiveParameter: "dF-ZH6GhGhg"),
                .init(track: .d,
                      title: "iPhoneのセンサで”位置情報”を得るために",
                      description: "みなさんiPhoneのセンサで取得できる位置情報と聞いて何を思い浮かべますか？\n\nおそらくCore Location Frameworkを使った緯度経度情報を思い浮かべる方が多いのではないでしょうか。\n\nロボット開発の観点では自己位置推定と呼ばれるLiDAR,カメラ,加速度センサなどを組み合わせることによってロボットの位置を推定する技術が日々研究されています。\n\n本トークでは位置情報を得るという目的のためにiPhoneのセンサを使って検証した結果を\n\n・どのようなセンサを使う方法があるか\n・取得できる位置情報の精度\n\nについて紹介します。",
                      user: SessionUserType.user4.user,
                      archiveParameter: "9C_ktCsQtGY")
            ]
        case .t1715_1755:
            return [
                .init(track: .a,
                      title: "ウーニャ、しってる。みんなふんいきでSwiftUIをつかってる",
                      description: "SwiftUIでViewを構築するのは難しいです。\n\n何も考えずに書くとクソデカViewになります。複数のViewに分割する場合も、プロパティやメソッドに切り出すのがいいか、構造体を定義するのがいいか迷います。\n\nViewの命名も迷います。Atomic Designに沿うのもいいですが、iOSと馴染めない気がします。UIKitに近い命名はわかりやすいですが、SwiftUIではスマートでないと感じます。\n\n「いきなりぐちってごめんなさい。ウーニャほんとはSwiftUIとなかよくしたいです…！」\n\nこのトークは、ウーニャ（私）とみんながSwiftUIのViewの分割と命名について一緒に考えます。\n\nまずはウーニャがViewの分割や命名の考え方を話すので、それについてコメントを頂き、議論してよりいいViewの構築を考えます。\n\nかなりふあんですが、だいじょうぶます。がんばるます。",
                      user: SessionUserType.user5.user,
                      archiveParameter: "duaazXhEs7M"),
                .init(track: .b,
                      title: "PiPを応用した配信コメントバー機能の開発秘話と技術の詳解",
                      description: "WWDC21 が開催されていた昨年の6月、AVKit に追加されたひとつの機能に社内がざわつきました。\n\nPiP（ピクチャ・イン・ピクチャ）の機能を応用して、Android の画面オーバーレイのようにアプリ外に自由なコンテンツを描画できる期待感を経験のあるエンジニアは感じていましたが、既存のアプリに機能を組み込むまでには R&D 的な開発やパフォーマンスとの戦いがありました。\n\nこのトークでは、ゲーム配信アプリミラティブに実装され多くのユーザーに利用されている、視聴者からのコメントや各種配信情報をアプリ外で表示する「配信コメントバー」機能の開発の裏側と技術の詳細、また更なる応用についてご紹介します。\n\n・「配信コメントバー」機能の概要\n・実装の解説\n・R&D 開発の勘所\n・パフォーマンスの解決\n・PiP と AVAudioSession との関係\n・PiP のカスタマイズ性\n・更なる応用",
                      user: SessionUserType.user6.user,
                      archiveParameter: "DlH7vVU79_8"),
                .init(track: .c,
                      title: "Swiftで我が家をより便利に、安全に！ ",
                      description: "我が家にはたくさんのIoTガジェットがあって、カーテンや玄関の鍵を開け閉めしたり、大活躍です。\n\nしかしエンジニアという人種は、既存の機能では満足できず、カスタムして、色々作り込みたくなるものです!\n\nそこで日頃お世話になっているSwift、我が家に余ってたラズパイ、そしてiPhoneの力を借りて、より便利で安全なスマートホームを目指した取り組みを共有します。\n\n具体的には…\n●ラズパイでのSwiftやServerSideSwiftフレームワークのセットアップ\n●iPhoneのセンサー情報をServerSideSwiftのAPI経由でラズパイのDBに書き込む方法\n●ラズパイと既存のIoTガジェットの連携方法\n●SwiftでラズパイのGPIO経由でセンサーやLEDを操作する方法\n\nなどをデモを交えて紹介する予定です。\n\nぜひ皆さんもSwiftを使った自宅のスマートホーム化、電子工作を楽しみましょう！",
                      user: SessionUserType.user7.user,
                      archiveParameter: "SlIu1MP595I"),
                .init(track: .d,
                      title: "SwiftUI Navigation のすべて",
                      description: "SwiftUIのNavigation APIは「Tab, Alert, Sheet, Navigation Link...」など様々な種類が存在し、OSによるインターフェースの変化も激しいです。\n\nまた、これらのAPIを利用して画面遷移を実現する際には多くの選択肢があり、画面遷移が増えれば状態管理も複雑になります。\n\nこのトークでは、そんなSwiftUI Navigationについて以下の内容で発表します。\n\n・SwiftUIのシンプルな画面遷移と状態駆動型の画面遷移について俯瞰\n・状態駆動型の画面遷移の利用時に起きる状態の不整合、不要な状態の管理を改善するswiftui-navigationの手法\n\n本トークではPoint-Free製のswiftui-navigationを深掘ることによって、よりSwiftUIのNavigationについて理解できるようになることを目指します。",
                      user: SessionUserType.user8.user,
                      archiveParameter: "2QVmktjSyaU")
            ]
        case .t1810_1830:
            return [
                .init(track: .a,
                      title: "SwiftPMのプラグイン機能をiOSアプリ開発に活用する",
                      description: "iOSアプリ開発にSwift Package Manager（SwiftPM）を活用するパターンを見かけるようになってきました。アプリ内のモジュール分割をSwift Packageを使って実現するパターンです。\n\nこの際、Swift 5.5以前のSwiftPMはビルド時に（SwiftGenなどで）コード生成する、などの処理を記述できませんでした。そのため、Xcodeプロジェクトのビルドスクリプト機能を使う必要がありました。\n\nしかし、Swift 5.6でSwiftPMにプラグイン機能が追加されたことで、Xcodeのビルドスクリプト機能に頼る必要がなくなりました。\n\n本トークでは、SwiftPMのプラグイン機能について解説し、iOSアプリ開発でSwiftPMをより一層活用するためのプラクティスをお話しします。",
                      user: SessionUserType.user9.user,
                      archiveParameter: "JBT8bdYOo6A"),
                .init(track: .b,
                      title: "CICD構築・自動化入門",
                      description: "プログラマーの三大美徳の一つと言われる怠惰さを一番発揮しやすい場所はどこでしょうか？\n\nそれはCICDを含む自動化の仕組みの構築にあると思います。\n\nソフトウェアの開発においてCICDはもはや必須です。\nではCICDで得られるものはなんでしょうか？\n\nそれは我々が余分な仕事をしなくて済む時間です。\n\n例えば、アプリをビルドするのに自分のPCを何十分も専有され、その間コードは一行も触れないなんてのは嫌なのです。\n\nそんな時間があるなら我々はもっと他にやりたいことがあるのです。面倒なことは機械が勝手にやって欲しいのです。\n\n本セッションでは今まで面倒な仕事を勤勉にこなしてきた人が明日から怠惰に過ごせるよう、普段の仕事を自動化していくための考え方と進め方についてお話します。\n\nそして導入した仕組みをコスト的に効率良く運用するためにどうすればいいか、導入した後の改善法についてもお話します。",
                      user: SessionUserType.user10.user,
                      archiveParameter: "OFzCYMJ85Eo"),
                .init(track: .c,
                      title: "MLOps for Core ML",
                      description: "MLOpsはML Operationsの略で、データ収集・前処理・学習・デプロイ・監視といった機械学習のライフサイクルの継続的な運用を効率化するための考え方や手法を総称してこう呼ばれています。\n\nたとえば、蓄積したデータを用いたモデルの再学習を定期的に自動実行し最新データに合うようモデルを改善し続ける仕組み、モデルを本番システムに自動デプロイする仕組み等が含まれます。\n\n機械学習をビジネスで本番運用するために不可欠な考え方として昨今ホットなトピックとなっています。\n\n一方で、Core MLモデルの世界ではMLOpsという考え方はまだそれほど広がっていないように思います。多くの場合は一度学習したモデルを利用し続けるか、手運用で再学習等を行っているのではないでしょうか。\n\nCore MLにMLOpsの考え方を導入しするとどのように継続的な運用を効率化できるのか、そのパターンを解説します。",
                      user: SessionUserType.user11.user,
                      archiveParameter: "-KXwx7W7UN4"),
                .init(track: .d,
                      title: "Dive into Mac Catalyst",
                      description: "Mac Catalystは，iOS/iPad OSと共通のプロジェクト，コードでmacOS Nativeアプリケーションも提供できるフレームワークです。\n\nさらに，Mac Catalystには，iOS/iPad OSでしか扱えないHomeKit.frameworkなどのフレームワークを使ったアプリを開発できるなどの開発効率以上の価値をもたらす側面も持ちます。\n\nしかしながら，それを使った開発には，AppKitのAPIを利用できない。起動時に勝手にウィンドウが表示されてしまうなどの課題もあります。\n\n本セッションでは，Mac Catalystでアプリを開発する上で必須のテクを筆者が公開しているオープンソースのアプリをベースに紹介します。",
                      user: SessionUserType.user12.user,
                      archiveParameter: "95r4Ve_XEWk"),
                .init(track: .e,
                      title: "PWAの今とこれから、iOSでの対応状況",
                      description: "ネイティブアプリと同様の機能をウェブアプリに追加できる技術、それがProgressive Web Apps (PWA)です。\n\niOSでも近年、徐々にPWAの機能が追加されています。これらの流れは、ユーザービリティに重きを置く昨今の潮流に即しているように感じます。\n\nこの発表では、PWAの現状とその可能性についてお話しします。\n\n・PWAとは？\n　・ウェブアプリのリーチと、ネイティブアプリの機能性を併せ持ったアプリ\n・PWAの各機能\n　・ホーム画面へのアイコンの追加\n　・キャッシュによるオフラインでの利用\n　・ カメラなどのハードウェアの利用\n　・プッシュ通知　など\n・iOSでの対応状況\n　・各バージョンでの対応の歴史\n　・プッシュ通知実装などの今後の対応\n　・PWAの事例とこれから\n　・アプリストア内外でのインストール\n・PWAを使うべきタイミング",
                      user: SessionUserType.user13.user,
                      archiveParameter: "-HmONXaqYPs")
            ]
        case .t1845_1905:
            return [
                .init(track: .a,
                      title: "20分間で振り返るIn-App Purchaseの歴史",
                      description: "iOSにおけるIn-App Purchase(アプリ内課金)はiOS 3から利用可能であり、その歴史は10年以上に及びます。\n\nこの長い歴史の中で、Ask to BuyやUpgrade / Downgrade、お試しオファーなどの多くの仕組みが追加され、やれることが格段に増えました。\n\nアプリ内課金をサポートするための仕組みも、Store Kit 2による実装方法の変更やアプリ内での返金機能をはじめ、Server NotificationsやTransaction Receiptのフォーマットの変更など、新しいものが次々にリリースされたり、StoreKit Testingによって自動テストが出来たりSandbox環境がアップデートされたりなど、課金のテストにまつわる状況も大きく変わりました。\n\n本トークでは、20分間でIn-App Purchaseの激動の歴史をじっくり振り返っていきます。",
                      user: SessionUserType.user14.user,
                      archiveParameter: "mVLB6Il442o"),
                .init(track: .b,
                      title: "量子情報工学への招待 〜iOSアプリ開発を通して学んでみよう〜",
                      description: "量子コンピュータや量子情報、量子暗号といった言葉を聞いたことがある人は多いと思います。これらには量子力学という物理の学問が使われています。\n\nそんな量子力学が作り出す不思議な世界へiOSアプリ開発、Xcodeのシュミレータを用いてご説明します。\n\n物理学の専門性がない方にもご理解いただけるように難しい話はしません。量子力学の面白さ、不思議さを知ってもらうためのトークです。",
                      user: SessionUserType.user15.user,
                      archiveParameter: "VyrPJhMC8NU"),
                .init(track: .c,
                      title: "ChaChaPoly and You, CryptoKit Explained",
                      description: "「え、CryptoKitを使いたいけど、いつ、何を使うべきかわからない。。。」の方はもう心配いらない。このトークで一緒にCryptoKitの謎を解きましょう！\n\nユーザーのデータを暗号化しないといけない開発案件が出てきて「CryptoKitを使うチャンス！」を思って調べてきました。それでみんなにそのKnowledgeを共有したいと思っています！みんなCryptoKitマスターになりましょう！\n\nContent\n・CryptoKitでできること\n・CryptoKitを使った対象鍵暗号（Symmetric Encryption）について\n・いつそのEncryptionを使うべきか\n・実装方法\n\nデータセキュリティーのために知っておきましょう！",
                      user: SessionUserType.user16.user,
                      archiveParameter: "vXDO1A8cf2M"),
                .init(track: .d,
                      title: "令和時代のXML処理を考える 〜もしあなたが巨大なXMLと相見える(あいまみえる)ことになったら〜",
                      description: "アプリがネットワークなど外部サービスを通じてデータをやり取りすることはもはや当たり前になっています。\nそのデータの代表的な形式としてJSONがあり、これはSwiftではCodableを通して簡易に変換することができます。\n\nしかしデータ形式というものはJSONに限らず様々なものがあり、例えばXMLもその一種です。\n\n「iOSにはXMLParserというものが用意されているから、ドキュメント見ながら実装すれば余裕っしょ」\n\nもし、そのドキュメント通りに動作しなかったらどう思いますか？\n\nこのトークは、XMLを処理するにあたって、XMLParserを中心に、iOSでできること、できないことを洗い出していかに効率的に処理ができるかを突き詰めるトークとなります。",
                      user: SessionUserType.user17.user,
                      archiveParameter: "LzEW4-44QFU"),
                .init(track: .e,
                      title: "広まれSafari Web Extensions！Safari Web Extensions の始め方",
                      description: "iOS 15 から Safari の拡張機能である Safari Web Extensions の開発が出来るようになりました。\n\nすでに素晴らしい拡張機能がいつかかリリースされているものの、まだまだその数が少ないように感じます。\n\nそこで今回は Safari Web Extensions の開発が広まるように、その始め方を紹介します。\n\n具体的には、Safari Extension App のテンプレートの中身を解説しつつ、ある要素をHTMLから削除する拡張機能を作るまでの手順を紹介します。\n\nSafari Web Extensions の持つ可能性を感じて頂ければと思います。",
                      user: SessionUserType.user18.user,
                      archiveParameter: "xdLY6SRkSdY")
            ]
        case .t1920_1940:
            return [
                .init(track: .c,
                      title: "「問題はソースコードではない！?」長生きするアプリの「品質低下」の謎",
                      description: "アプリを一から作り直したことはありますか？\n\nソースコードがごちゃごちゃで可読性が低かったり、修正が難しいバグが多かったりして「一旦作り直し」と判断されたこともあるかもれません。\n\n作り直したものも最初はピカピカだったが、時間と共に汚くなり、またバグの多いごちゃごちゃしたソースコードになり、開発が難しい状態に戻ってしまいます。\n\nそしてまた、作り直すか、大規模なリファクタをするか、我慢してごちゃごちゃなまま開発を継続するかの選択が迫られます。\n\nどの選択も非常にコストがかかります。\n\nどうしてこういうことが起きるのでしょうか？\n\n今回は\n・なぜ多くのアプリは長生きするとごちゃごちゃになるのか\n・なぜ作り直しても同じ問題が再発するのか\n・これらの問題を避けることができるのか\n\nについて話したいと思います。\n\nヒント: 問題はソースコード以外のところにあるかもしれません！",
                      user: SessionUserType.user19.user,
                      archiveParameter: "M30_FzIG8Ys",
                      isSponsor: true),
                .init(track: .d,
                      title: "2022年の新規アプリ開発で採用した技術",
                      description: "メドピア VPoEから会社の紹介をさせてください！",
                      user: SessionUserType.user20.user,
                      archiveParameter: "DiJ8jTX8QWg",
                      isSponsor: true),
                .init(track: .e,
                      title: "メタバースを支えるエンジニアの生態について",
                      description: "iOSDCに参加のエンジニアのみなさん、メタバースの開発は Unity や Unreal Engine を駆使するような 3DCG エンジニアの担当領域だと思って敬遠していませんか?\n\n 私達クラスター株式会社のカジュアル面談でも、よく聞かれる質問の一つは iOS/Andoird/Web/etc… エンジニアでも活躍する場所が有りますか? というものです。\n\n実際は iOS/Andoird/Webエンジニアが多数在籍していますし、更には音響技術が得意なエンジニアから機械学習の研究者まで様々な人材が所属しています。\n\nまた、その出身となった業界もゲームメーカーやWeb系開発会社、金融機関などなど様々です。\n\n本公演では、どんなエンジニアがどんな得意分野をもってクラスターに参画してきたかをご紹介するとともに、もう一つのよくある質問である、どんな開発フローで業務を進めているのかについてをお話しします。",
                      user: SessionUserType.user21.user,
                      archiveParameter: "SA7X8H9CHpQ",
                      isSponsor: true)
            ]
        case .t1950_2000:
            return [
                .init(track: .a,
                      title: "Today's Update")
            ]
        }
    }
    
    static var models: [SessionModel] = SessionDay0Type.allCases.flatMap(\.models)
}

// MARK: - SessionType 1
enum SessionDay1Type: Int, CaseIterable, SessionType {
    case t1000_1040,
         t1105_1145,
         t1200_1220,
         t1300_1320,
         t1335_1355,
         t1410_1450,
         t1505_1545,
         t1555_1640,
         t1650_1710,
         t1720_1730,
         unconference
    
    var index: Int {
        rawValue
    }
    
    var time: String {
        switch self {
        case .t1000_1040: return "10:00~10:40"
        case .t1105_1145: return "11:05~11:45"
        case .t1200_1220: return "12:00~12:20"
        case .t1300_1320: return "13:00~13:20"
        case .t1335_1355: return "13:35~13:55"
        case .t1410_1450: return "14:10~14:50"
        case .t1505_1545: return "15:05~15:45"
        case .t1555_1640: return "15:55~16:40"
        case .t1650_1710: return "16:50~17:10"
        case .t1720_1730: return "17:20~17:30"
        case .unconference: return "13:00~14:45"
        }
    }
    var models: [SessionModel] {
        switch self {
        case .t1000_1040:
            return [
                .init(track: .a,
                      title: "オープニング")
            ]
        case .t1105_1145:
            return [
                .init(track: .a,
                      title: "アニメーションAPIのすべて",
                      description: "iOSにはさまざまなアニメーションAPIがあります。思いつくだけでもUIView.animate()、Core Animation、UIViewPropertyAnimatorがあり、Core Animationが提供するAPIは膨大ですべてを使った人は稀でしょう。\n\n物理演算を追加するUIKit Dynamicsもあります。さらにSwiftUIでは.animation()や.withAnimation()というModifierによる手段が提供されています。\n\nこれらのAPIがカバーする範囲は重なっていて、同じことを別のAPIでも実現できます。それぞれのAPIをどのように使い分けるのでしょうか？\n\nこの講演では各APIの使い方を実用的なパターンの実例を示しながら解説し、どのような判断で使い分けるべきかを示します。すべてを明確に理解し、表現の引き出しを増やして、アニメーションをマスターしましょう！",
                      user: SessionUserType.user22.user,
                      archiveParameter: "nmp6xl1Uc88"
                     ),
                .init(track: .b,
                      title: "Swift Concurrency Next Step",
                      description: "Swift5.5で登場したSwift Concurrencyは、非同期処理を簡潔で安全に扱える機能です。主な機能は既に追加済ですが、現在も新しい機能の追加や改善が行われています。\n\n今回は、この1年で見られた進化や実装上のTipsなどを紹介します。また、Swift6以降に既存のコードが動かなくなるリスクを最小限に抑えるための段階的導入方法など、ちょっと先の未来についても見ていきます。\n\n例:\n・Swift5.6以降の新機能や変更\n・エラーやキャンセル時の子タスクの挙動\n・Taskのinitとselfの関係\n・Actorが切り替わるタイミング\n・swift-async-algorithmsから見る実装方法\n・iOS frameworkとの連携\n・Swift6で何が起こるのか？\n\nこれからConcurrencyをもっと使ってみようと思っているみなさまのお役に立ちましたら幸いです。",
                      user: SessionUserType.user23.user,
                      archiveParameter: "-fl-e9X4Gvk"),
                .init(track: .c,
                      title: "Swift アクターモデルと Elm Architecture の融合",
                      description: "この発表では、Swift アクターモデルと Elm Architecture を融合したフレームワーク「Actomaton」について、実用例を中心に紹介します。\n\nhttps://github.com/Actomaton/Actomaton\n\nComposable Architecture では飽き足らないマニア向けの内容を予定しています。\n\n1.Actomaton の簡単な紹介\n2.アプリの状態管理の基本的な例：「ディープリンク」「タイムトラベル」\n.並行タスクキューを用いた副作用管理の例：「並行ダウンローダー」「並行 Web クローラー」\n4.アクター（オブジェクト指向）と Elm Architecture （関数型プログラミング）の両方を用いた計算モデルの親和性について\n5.（時間があれば）やはり圏論。圏論は全てを解決する。",
                      user: SessionUserType.user24.user,
                      archiveParameter: "mb_Z_qgT3pc"),
                .init(track: .d,
                      title: "Unreal EngineとiPhoneを使って始めるリアルタイムAR配信",
                      description: "ここ数年、格好良いAR表現が付いた映像が増え、皆も色々な所で目にしていると思います。\n\nエンジニアなら自分でも実装して実現したくないでしょうか？\n\n私は昨年からARを本業としてAR表現があるリアルタイム配信をいくつか実施してきました。Unreal Engineを使いカメラとトラッキング機材を中心に連携し作成していきます。\n\nその実現に必要な要素を解説しスキルを伝授していきます！\n\n・ワークフロー解説\n・CG原点を置きCGの空間と現実空間を一致させる方法\n・カメラトラッキング方法\n・Unreal Engineを使った基本的なシーン作成\n・iPhoneを使う手法\n・PTZカメラを使う手法\n\nデモと手法解説を軸に、AR表現に興味を持った人がさらに興味を持つようなセッションです。",
                      user: SessionUserType.user25.user,
                      archiveParameter: "dpt4ao_iHHM"),
                .init(track: .e,
                      title: "あなたの知らない AR の可能性を空間レベルで拡げる VPS の世界",
                      description: "SnapのCustom Landmarker、ARCoreのGeospatial API、NianticのLightship、そしてARKit 6のLocation Anchor、他にもありますが、これらはすべてVPSと呼ばれるものです。\n\nここで言うVPSは“Virtual Private Server”ではなく“Visual Positioning Service/System”です。\n\n緯度経度をもとにするGPSとして馴染み深い“Global Positioning System”に対し、画像による空間情報をもとに自己位置推定する技術がVPSです。\n\n本セッションでは、今後のARに関する要素技術として重大な位置づけになると考えられる “VPS”そのものとその周辺技術、実際のユースケースや概況に加え、いずれかのVPSソリューションを用いた「実際に動作するデモ」を交えて解説します。",
                      user: SessionUserType.user26.user,
                      archiveParameter: "-HVHSV9H3sE")
            ]
        case .t1200_1220:
            return [
                .init(track: .c,
                      title: "iOSライブラリをセルフサービスで生成する仕組み ",
                      description: "弊社では様々な自動化の仕組みに取り組んでいますが、その中でiOS/Androidのライブラリ、特にAPIクライアントについて、セルフサービスで生成する仕組みについて話したいと思います。\n\nほぼ全てのアプリで欠かせないのがRESTを主としたAPIサーバーと対話するネットワーキングの実装だと思いますが、APIごとに毎回同じような開発をするのは非効率的です。そこで目をつけたのがOpenAPIでした。\n\nOpenAPIとはAPI設計を行う仕様のことですが、このトークでは、OpenAPIを元にしたコード自動生成からデプロイまでを開発者が1行もコードを書かずに生成できるようにした過程を紹介します。\n\nまた、中〜大規模チームでのOpenAPI導入の背景やメリットに触れると共に、開発者の要望に応じて、生成されるコードをどうカスタマイズしたかなどもお話ししようと思います。",
                      user: SessionUserType.user27.user,
                      archiveParameter: "wyk1yZVhYKE",
                      isSponsor: true),
                .init(track: .d,
                      title: "Kotlin Multiplatform Mobile でiOSとAndroidの実装差異を無くす",
                      description: "iOSアプリと一緒に、Androidアプリを作成することはよくあります。2つのアプリを同時に開発すると問題がよく起きます。「iOSとAndroidで動きが違う」と。\n\n実装するエンジニアの認識のズレ、言語仕様の違い、例えどれだけ念入りにやったとしてもこの問題はいつか必ず発生することでしょう。\n\nそのような問題をKMM(Kotlin MultiplatformMobile)を用いて解決します。\n\nアプリのビジネスロジックをコードレベルから共通化し、OS間での差異が起こらないような開発ができる上に、ビジネスロジック部分の記述はKMM一つで済むようになります。\n\nこのセッションでは、基本的なKMMの概念の説明から、実際にiOSのプロジェクトへのKMM導入し動作させるまでを、弊社での取り組みを交えて解説いたします。",
                      user: SessionUserType.user28.user,
                      archiveParameter: "6_2pttJPL7k",
                      isSponsor: true),
                .init(track: .e,
                      title: "React NativeからNativeアプリへ ~スタートアップ企業における「機能開発と保守性担保」の両立への挑戦~",
                      description: "ビットキーは「テクノロジーの力であらゆるものを安全で、便利で、気持ちよく繋げる」をミッションに掲げるスタートアップ企業です。\n\n自社プラットフォームからハードウェア、ソフトウェアまで開発している弊社ですが、本セッションではReact Native製iOSアプリworkhubを取り上げます。\n\nworkhubは'働く空間において人と仕事の間のあらゆるものを繋げ、新しい働き方に即した体験を提供する'アプリです。\n\nスタートアップにおいて求められる'機能開発のスピード感'と、決して無視できない'保守性の担保'をいかに両立するか？をテーマに、1年半の間取り組んだNative化をご紹介します。\n\n・スタートアップにおけるソフトウェア開発に求められるもの\n・なぜReact NativeアプリをNative化するに至ったか\n・Native化の方法論\n・Native化により得られたもの / 難しかった点",
                      user: SessionUserType.user29.user,
                      archiveParameter: "1b3vYgos88E",
                      isSponsor: true)
            ]
        case .t1300_1320:
            return [
                .init(track: .a,
                      title: "UIKit ベースの大規模なプロジェクトへの SwiftUI 導入",
                      description: "タクシー配車アプリ「GO」では、UIKit ベースで実装しており、ViewController の数は300近くあります。\n\n2019年の WWDC で発表された SwiftUI の機能を徐々に活用していき、2021年に iOS 12 のサポートを終了したタイミングでプロダクションに SwiftUI で作った画面を展開していきました。\n\n本トークでは、大規模なプロジェクトにおいて、どのように SwiftUI を導入し活用しているかをご紹介します。\n\n・SwiftUI の導入\n・UIKit ベースのプロジェクトでの SwiftUI 利用\n・Xcode Previews の活用\n・SwiftUI 利用したことで得られたメリット\n・ここが辛いよ SwiftUI\n・SwiftUI 利用のこれから",
                      user: SessionUserType.user30.user,
                      archiveParameter: "KJ7zzk9fj8E"),
                .init(track: .b,
                      title: "Swift 5.7で変わる正規表現を試してみよう",
                      description: "現在swift-evolutionでは大量のproposalと共に長年Swift上で不便だった正規表現関連の実装を刷新する流れが続いています。実際にWWDC 22でもSwift 5.7のリリースとともにRegexBuilderと正規表現リテラルが導入されることが発表されています。\n\nこのトークではNSRegularExpressionやNSStringにおける課題がどのように解決されているかをswift-evolutionの各proposalをもとに振り返り、iOSやサーバーサイドでのアプリケーションや文字列処理が生きてくる書き捨てのスクリプト（例えばログ解析など）でどれぐらい実用的に利用できるのかをベンチマーク結果を添えて検証していきます。\n\n特に普段Rubyなどで書くことが多い書き捨てスクリプトを置き換えるポテンシャルがあるのかどうかに個人的に興味があります！！いかに！？",
                      user: SessionUserType.user31.user,
                      archiveParameter: "bLizhJKMpzw"),
                .init(track: .c,
                      title: "CoreGraphicsでドット絵を描こう",
                      description: "このトークを通して、ドット絵を描くアプリを作ってみましょう。\n\nドット絵は、イメージの最小単位であるピクセルを塗ることで描くことが出来ます。\n\nCoreGraphicsの世界を通してピクセルを見ることで、普段意識しないイメージがどのようにしてメモリ内に格納されているかを知ることもできます。\n\nまた、CGContextを直接操作することでCGContextに存在しない描画APIの開発もしてみましょう！\n\nこのトークはドット絵エディタEditormodeの開発者がお送りします。\n\nhttps://apple.co/3GJyqRF",
                      user: SessionUserType.user32.user,
                      archiveParameter: "D8CDDgnPgTo"),
                .init(track: .d,
                      title: "既存サブスクリプション商品にアップグレード・ダウングレード商品を追加しよう",
                      description: "本トークでは、既存サブスクリプション商品にアップグレード・ダウングレードを追加する方法についてご説明します。\n\n具体的には、アップグレード・ダウングレード・クロスグレードについて\n\n・サブスクリプショングループとは\n・レベルの設定\n・レシートはどうなるのか\n\n上記を公式ドキュメントを織り交ぜながらご説明します。\n\n運用しているサブスクリプションにアップグレード・ダウングレードを追加するには\n\n・新規商品を申請するために注意すべき箇所は何か\n・SandBoxで検証する際のtips\n・SandBoxで確認できない範囲の検証結果\n\n導入しづらい運用ケースとは\n\n・複数のサブスクリプショングループを運用している場合\n・クレジットや他プラットフォームでの決済手段がある場合\n\nを予定しております。",
                      user: SessionUserType.user33.user,
                      archiveParameter: "W8UyNbfMf7Y")
            ]
        case .t1335_1355:
            return [
                .init(track: .a,
                      title: "入門 SwiftUI Alignment Guide ",
                      description: "SwiftUIは細かく指定しない限り簡潔にレイアウトを記述できることも多い一方で、\n\nAuto Layoutでは簡単にできていたことが意外と難しかったり、そもそも実現が困難なケースもあります。\n\nこのトークでは、VStackやHStackで単にleadingやtopなどを指定するだけでは実現が難しいレイアウトを攻略するために有効なAlignment Guideについて、次のステップで学ぶことができます。\n\n1.Alignmentの概念および挙動についての基礎\n2.alignmentGuide(_:computeValue:)の理解と利用方法\n3.Custom Alignmentの実践的な使い方と制約\n\n想定する対象者\n\n・SwiftUIをなんとなく書けるようになってきた人\n・alignmentGuideやCustom Alignmentを使ったことがないor使い方がよくわからない人",
                      user: SessionUserType.user34.user,
                      archiveParameter: "RdMbCdqLAnw"),
                .init(track: .b,
                      title: "Swift Concurrency時代のリアクティブプログラミングの基礎理解",
                      description: "リアクティブプログラミングは非同期プログラミングの手段として使われることがありますが、本来は非同期データストリームをうまく扱うためのものです。Swift Concurrencyが導入された今こそ、Combineなどの具体的なライブラリから一歩距離を置いて、リアクティブプログラミングそのものを学習しておきましょう。\n\nこのトークでは、リアクティブプログラミングがデータフローの記述方式であるということを基本からおさらいします。リアクティブプログラミングを図的に理解でき、UIや通信のイベント配送設計も自在にできるようになります。\n\n非同期はリアクティブプログラミングの外の世界と接続するときや内部実装には必要です。両者のポジションの違いを整理し、Concurrencyの機能をそのまま使うべきところと、リアクティブプログラミングでデータフローを記述すべきところが、よく分かるように説明します。",
                      user: SessionUserType.user35.user,
                      archiveParameter: "k9CVckUo75g"),
                .init(track: .c,
                      title: "音声配信アプリにおけるiOSを使った音声配信の全てと裏側",
                      description: "Voicyでは日々パーソナリティさんという音声投稿者による音声配信がされております。\n\niOSにおいて音声配信をする上で欠かせないAVFAudioを利用しております。\n\nAVFAudioには多種多様な機能がありますが、実際サービスを扱っていく上で一体どんなことに注意し何を必要があるのか？がわからないことが多いです。\n\n本トークでは音声配信をiOSで実装する上でどのように考え実装するべきなのかを全てと裏側という形でお伝えしたいと思います\n\n・AVFAudioを利用した音声の取り扱い\n　・音声収録\n　・音声配信\netc\n\n・Voicyで利用している音声配信の提供方法\n　・収録配信\n　・リアルタイム配信\n・課題や今後の展望",
                      user: SessionUserType.user36.user,
                      archiveParameter: "soFP-y97RvI"),
                .init(track: .d,
                      title: "タクシーアプリ「GO」から学ぶ Google Maps SDK 活用術",
                      description: "タクシーアプリ「GO」は地図をベースとしたアプリです。地図には Google Maps SDK が利用されています。\n\nGoogle Maps SDK で提供される機能を駆使して、さまざまな情報を地図上で表現しています。その実装は難しいこともあり、あらゆる工夫を凝らして実現されているものもあります。\n\n「GO」での実例を元に、実装上のハマりポイントや苦労して実現したところ、開発時に遭遇した不思議な現象などを紹介します。\n\n・地図上を走るタクシーの動態表示\n・近くの道路に自動的に引き込ませる機能\n・ルートのグラデーション表示\n・タクシーを配車できないエリアを明示する\n・地図の中心点を変えずに、複数の地点が収まる形にズームレベルを調整する\n・地図のパフォーマンスを下げて省電力で動作させる\n・カラースキームで地図の雰囲気を変える\n・Google Maps における緯度経度の不思議\n\netc..",
                      user: SessionUserType.user37.user,
                      archiveParameter: "yzRKOwad9KE")
            ]
        case .t1410_1450:
            return [
                .init(track: .b,
                      title: "詳解 Core NFC - NFC を用いた iOS App 開発のてびき",
                      description: "NFC とは駅・空港での自動改札機やお店での電子マネー決済、社員証や学生証をかざした入退出管理など、日常でよく見かけるアレを叶える技術です。\n\niPhone に搭載されている NFC を私たちの App で使うためには Core NFC を用います。これは iOS 11 から利用可能になり、iOS 13 のタイミングで大きくアップデートされました。昨今の情勢から非接触技術が注目されたり、eKYC に利用できたりと、現在進行形でさまざまな App で利用が広がっています。\n\n私は iOS 13 のときから3年間、この Core NFC を使った App の個人開発を続け、関連する OSS も公開してきました。それによって得た iOS 固有の NFC 利用まわりの知見や、これから Swift Concurrency + Core NFC を活用する App を開発する際の流れ・例を紹介します。",
                      user: SessionUserType.user38.user,
                      archiveParameter: "RhLszeyR4h0"),
                .init(track: .c,
                      title: "SwiftUIとUIKitを仲良くさせる",
                      description: "SwiftUIが発表されてからすでに3年が経ちました。しかしいまだに開発現場から採用が難しいという声が聞こえてきます。\n\nUIKitとSwiftUIの併用も可能ですが、実際に採り入れてみるとさまざまな問題が発生しました。このセッションではそれらの問題を解決する手法を紹介します。\n\n・レイアウト・プレビュー\n　・UIView / UIViewControllerをSwiftUIの中で使うとき\n　　・RepresentableKitの紹介\n　・ViewをUIKitで使うとき\n・Appライフサイクル\n　・UIApplicationDelegateとUISceneDelegateを引き続き使う\n　・Appでまだ取得できないイベントをSwiftUIに伝える\n　・iOS 13の交互性を考慮する\n・状態管理\n　・共通の状態をどうするか\n　・依存の受け渡し",
                      user: SessionUserType.user39.user,
                      archiveParameter: "5C7cryhPhvk"),
                .init(track: .d,
                      title: "正規表現って結局何なのさ？〜エンジニアのためのコンピューターサイエンス入門〜",
                      description: "皆さん多かれ少なかれ正規表現を使ったことがあると思います。コマンドラインツールで、エディタの検索で、そしてNSRegularExpressionで。単純な文字列検索に比べ、正規表現はとても表現力豊かでパワフルな検索を可能にします。\n\nSwift Evolutionにも正規表現に関する多くのproposalがあり、Regex型やRegexリテラルなどが正式に実装される日も近いでしょう。\n\nしかしこの正規表現とは一体何者なのでしょうか？\nどんなものが表現でき、どんなものが表現できないのでしょうか？\n\n多くのメタ文字や演算子記号があるためとても複雑なものと思われがちですが、実際にはたった3つの文字列の演算ルールだけで構成されています。\n\n本トークでは状態遷移図の一種であるオートマトンからスタートして正規表現の原理を紐解きその限界を探っていきます。",
                      user: SessionUserType.user40.user,
                      archiveParameter: "6B3ND8o4Ugg")
            ]
        case .t1505_1545:
            return [
                .init(track: .a,
                      title: "神速iOSDC〜6年分〜",
                      description: "みなさんが初めて参加したiOSDCはいつでしょうか。\n\n私が初めて参加したiOSDCは2018年のものでした。\n\n初参加の2018年からiOS・Swift界隈のトレンドや新しい技術は目まぐるしく変化し、私が初めて参加した年からは想像もできないような進化を遂げています。\n\nところで、iOSDCにはYouTube公式チャンネルがあり、iOSDC2016からのセッション動画をなんと無料で視聴することができます。\n\nこのトークではiOSDCチャンネルにあげられている458本の動画を踏まえ、これまで6年分のiOSDCを5分に凝縮し、オフライン開催が戻ってきた今だからこそ、神速で振り返りを行っていきたいと思っています。\n\nこのトークを聞くことで、iOS・Swift界隈のトレンドを振り返るとともに、6年分のiOSDCの思い出を一気に蘇らせることを約束します。",
                      user: SessionUserType.user41.user,
                      archiveParameter: "aQDR1mzQzGI",
                      isLT: true),
                .init(track: .a,
                      title: "Apple Watchを使い倒す 〜Watchから取れるデータとその活用法〜",
                      description: "初代Apple Watchが発売されてから早7年。Apple Watchは進化を続け、圧倒的な世界最多シェアを誇るスマートウォッチとなりました。そんなApple Watchを自身のアプリ開発にも活用したいところですが、具体的にどう活かせば良いかは悩みどころですよね…。\n\nということで今回は、\n\n1.どんなデータをApple Watchから取得できるのか\n2.どんな用途に利用されている・できそうか\n\nこれらの観点から整理し、ウォッチを活用したユニークなアプリの開発につながるヒントを共有できれば幸いです。",
                      user: SessionUserType.user42.user,
                      archiveParameter: "qgZVu-Fl5E4",
                      isLT: true),
                .init(track: .a,
                      title: "SF Symbolsの無限の可能性に迫る、SF Symbolsアートの世界",
                      description: "SF Symbols 3.3の時点では、3,300を超えるシンボルを備えています。この多種多様なシンボルのおかげで開発者は0からアイコンを作る必要は無く、開発に専念することが出来ます。\n\nでも、どうでしょう？\n\n3,300を超えるシンボルがあるのに、何個のシンボルを使ったことがありますか？実際、日の目を見れていないシンボルたちが沢山あります。\n\n「これ一体いつ使うんだ？」\n「こんなシンボルまであるんだ！」\n「これは使えそう！」\n\n個性豊かなシンボルたちが使って欲しそうにこちらを見ています。\n\nこのLTでは、そんなシンボルたちを活用したSF Symbolsアートの数々を紹介します。少しでもSF Symbolsのことが好きになっていただければ嬉しいです。\n\n(参考: https://twitter.com/littleossa/status/1516540893142347778)",
                      user: SessionUserType.user43.user,
                      archiveParameter: "9UuanKVg5rY",
                      isLT: true),
                .init(track: .a,
                      title: "レトロゲームを楽しむ環境を構築する",
                      description: "ファミコン、スーファミ、ゲームボーイ、64、GC、Wii、PS1、PS2のレトロゲームをiPhone/Macで遊ぶ話です。Windowsと比べて、Macの情報がなく、令和では手に入りにくい物だったりで、無いものは作りました。\n\n再び、昔懐かしいゲームを楽しみましょう！\n\n当日のLT内容(予定)です。\n・違法ダウンロードは絶対ダメ\n・ 無いものは作ったゲームソフトの吸い出し機\n・ ゲームコントローラーを認識させる\n・ レトロゲームをプレイ！",
                      user: SessionUserType.user44.user,
                      archiveParameter: "0HQ4tXC3rAs",
                      isLT: true),
                .init(track: .a,
                      title: "Bluetoothでレゴをリモートプログラミングしよう ",
                      description: "プログラミング可能なロボットキットである「LEGO BOOST」の発売以降、Bluetoothによるリモートプログラミングに対応しているレゴのセットがたくさん発売されています。その数はなんと20以上！\n\nその中にはプログラミングできることをアピールしていないセットも多くあります。プログラミング＝マインドストームではありません。あなたがお持ちのセットも実はプログラミング対応しているかもしれませんよ？\n\n本トークでは、レゴ社が公開している「LEGO Wireless Protocol」を中心に、どんな種類のレゴブロックがどんな感じでプログラミングできるかについてお話しします。あなたのレゴ作品をiPhoneやApple Watchとつなげて、思う通りに動かしましょう！",
                      user: SessionUserType.user45.user,
                      archiveParameter: "qwNDjHeoRyA",
                      isLT: true)
            ]
        case .t1555_1640:
            return [
                .init(track: .a,
                      title: "挑戦！ISUCON de Server-side Swift 〜タイムゾーンには気をつけろ〜 ",
                      description: "皆さんは ISUCON をご存知でしょうか？ISUCON は 課題として提供されるWebサービスを「いい感じにスピードアップ」するコンテストです。\n\nさて、ここに3人のiOSエンジニアが勝負を挑みました。この３人、持ち前の iOS 開発で培った Swift 力で、シビアな制限時間の中、課題をSwift にフルスクラッチで書き換えようとします。果たして優勝を勝ち取り、iOS開発、そしてSwift言語の威厳を他の参加者に知らしめることはできたのでしょうか。\n\nこのトークを通じて、iOS、macOS アプリケーションの開発者の皆さんがどのようにしてサーバーサイドSwiftに取り組めるか、そして本格的なアプリを実装できるかを学べるやもしれません。 iOS クライアントだけでなく、サービス全てをSwiftにしたい方、必見です!",
                      user: SessionUserType.user46.user,
                      archiveParameter: "nrmZ8sO8Az0",
                      isLT: true),
                .init(track: .a,
                      title: "独自の共通認証基盤を用いているサービスでアカウント削除機能を提供したときの道程",
                      description: "Review Guideline 5.1.1(v) - Account deletion requirement がついに6月30日に施行されました。これからアカウント作成が出来るアプリは、アカウント削除機能を提供する必要があります。\n\nアカウント削除機能はあまり優先して開発されない(しづらい)機能の一部であり、マネーフォワードクラウド確定申告でも提供出来ていなかった機能でした。\n\nこのLTでは、急遽宣言されたAccount deletion requirementに対して、共通ID基盤の提供・数多くのサービス展開による弊害、1ユーザーが複数のグループに属せるというサービスとしての難しさ、確定申告シーズンにぶち当たった必須化スケジュールを乗り越えて、マネーフォワードクラウド確定申告がアカウント削除機能を提供したときの苦悩の道程を紹介します。",
                      user: SessionUserType.user47.user,
                      archiveParameter: "ZhTqXpqOHF0",
                      isLT: true),
                .init(track: .a,
                      title: "Exposure Notification Privacy-preserving Analytics Architectureの仕様について ",
                      description: "COVID-19のパンデミックに対する解決策としてAppleとGoogleが設計したExposure Notification Privacy-preserving Analytics (ENPA) Architectureについてトークします。\n\nENPAは、最新のプライバシー保護技術および暗号化技術を活用して、個人データを一切開示せずにデータを収集することを可能にするものです。\n\n強力なプライバシー原則を維持しながら、収集された測定基準の信頼をどのように保護したのか、どのような仕組みを利用して情報を収集したのかをExposure Notification Privacy-preserving Analytics White Paperから解説いたします。",
                      user: SessionUserType.user48.user,
                      archiveParameter: "Lk0oHcoj3J4",
                      isLT: true),
                .init(track: .a,
                      title: "バックポートして学ぶ新APIの仕組み ",
                      description: "Appleプラットフォームのアップデートは、一部を除き、最新OSのみに提供されます。\n\nせっかく待望の新機能が登場しても、サポートOSポリシーによっては、使えるのは数年後...\n\nならば、自分で作って、来たる日に備えましょう。\n\n実現する上での難易度は高いものかもしれませんが、多くは既存の仕組みを組み合わせることで、ソフトウェアとして解決できるはずです。自分でバックポート実装を作ってみれば、新API、その周辺の仕組みについて熟知することができます。\n\nこのトークでは、2021年に登場したSwiftUI.AsyncImageを、すべてのSwiftUI環境にバックポートした経験を題材に、知見を話します。\n\n・新APIの調べ方\n・バックポート実装のTips\n・メンテナンスする上での難点",
                      user: SessionUserType.user49.user,
                      archiveParameter: "Ay0kQoMQtws",
                      isLT: true),
                .init(track: .a,
                      title: "UIStackView逆引きレシピ",
                      description: "UIStackViewとても可愛いですよね！SwiftUI時代になれば使わなくなると思いますが、現状はまだまだUIStackViewを活用する機会は多くあると思います。\n\nこのLTでは、私が愛してやまないUIStackViewについて、こんなケースではUIStackViewでどう解決する？というのを逆引きレシピ形式で紹介できればと思います。\n\n・ある条件ではこのボタン消えてスペースを詰めいないといけない！トルツメ制御めんどうすぎ！\n・画面を回転させたときにレイアウトが大きく変わっちゃう！助けて！\n・デザイナーさんから「ここは10、でもここは15」と細かくマージン指定されてる！どうしたらいい？",
                      user: SessionUserType.user50.user,
                      archiveParameter: "IQLXD6zreTg",
                      isLT: true),
                .init(track: .a,
                      title: "手で触れずにアプリを動かす技術 ",
                      description: "iPhoneがスマートフォンと称されてはや数年。巨大なタッチスクリーンを備えたiPhoneはその操作性でたくさんの人に受け入れられてきました。\n\nでも、ちょっと待ってください。タッチしないと動かないって、いまいちスマートじゃなくないですか？\n\nそんなわけで、iPhoneを触らずともアプリをなんとか動かすことができないか、様々な技術を駆使してアプリを動かせないかを検討してみます。\n\n例えバッキバキに割れたiPhoneでも、見事動かしてみせましょう。",
                      user: SessionUserType.user17.user,
                      archiveParameter: "tcje1T97Zv8",
                      isLT: true)
            ]
        case .t1650_1710:
            return [
                .init(track: .c,
                      title: "SwiftUIのハマりどころとその回避策 ",
                      description: "AirインボイスのiOS開発チームは、AirインボイスiOSアプリをSwiftUIで開発しています。\n\nWWDC2022でiOS16が発表され、iOS14以上をサポートとすることができるアプリが増えたことで、本格的にSwiftUIの導入を検討している方も多いと思います。しかし、最新のOSのみをサポートするのではなく、iOS14系や15系もサポートするとなると、そこには数多くのハマりどころが存在します。また、要件によってはSwiftUIでの実現に工夫が必要なポイントも数多く存在します。\n\n本トークでは、iOS14以上を対象としたAirインボイスiOSアプリにおいてSwiftUIを用いてさまざまな要件を実現するにあたり、はまったポイントやそれらをどのように回避したかを共有します。",
                      user: SessionUserType.user52.user,
                      archiveParameter: "hgYpeVLggAs",
                      isSponsor: true),
                .init(track: .e,
                      title: "レガシーなプロダクトからドメイン層を再設計する",
                      description: "タウンワークiOSアプリは、10年以上開発が続いています。度重なる機能追加や仕様変更によって、プロダクトは徐々に複雑に、レガシーになっていきました。そのため、Clean Architectureの導入によるレガシーからの脱却を図りました。\n\nClean Architectureに則りドメイン層を分離してみましたが、いくつか不明な点があり、技術顧問の和田卓人氏に相談したところ、そもそも我々のモデリングにたくさんの改善点があることがわかりました。\n\nそこから、チームの中で既存コードからドメインモデルを発掘し、再設計する旅が始まりました。\n\nこのセッションでは、ドメイン層が何をするかよくわからない、設計に困っている人に向けて、アプリにとってのドメインとは何か、どのように見つけ出し設計すればよいか、そして評価の方法について私たちの経験を交えてお話します。",
                      user: SessionUserType.user54.user,
                      archiveParameter: "ad6rlqo-o0A",
                      isSponsor: true)
            ]
        case .t1720_1730:
            return [
                .init(track: .a,
                      title: "Today's Update")
            ]
        case .unconference:
            return [
                .init(track: .e,
                      title: "スタートアップへの挑戦",
                      description: "理工学術院 教授 朝日透 ほか5名\n\n13:00-13:20 Greater Tokyo Innovation Ecosystem (GTIE)の紹介 理工学術院 教授 朝日透\n13:20-13:30 Urth CEO 田中大貴\n13:30-13:40 amulapo CEO 田中克明\n13:40-13:50 レイワセダ CEO 畠山祥\n13:50-14:05 休憩\n14:05-14:15 Ubiq CEO 日野真幸\n14:15-14:25 StatHack CEO 松葉亮人\n14:25-14:35 EAGLYS CSO 丸山祐丞",
                      user: SessionUserType.user97.user,
                      archiveParameter: "88PE_N4WJX0")
            ]
        }
    }
    
    static var models: [SessionModel] = SessionDay1Type.allCases.flatMap(\.models)
}

// MARK: - SessionType 2
enum SessionDay2Type: Int, CaseIterable, SessionType {
    case t1000_1010,
         t1015_1035,
         t1050_1110,
         t1125_1145,
         t1200_1220,
         t1300_1340,
         t1355_1415,
         t1430_1450,
         t1505_1545,
         t1555_1640,
         t1650_1710,
         t1720_1800
    
    var index: Int {
        rawValue
    }
    
    var time: String {
        switch self {
        case .t1000_1010: return "10:00~10:10"
        case .t1015_1035: return "10:15~10:35"
        case .t1050_1110: return "10:50~11:10"
        case .t1125_1145: return "11:25~11:45"
        case .t1200_1220: return "12:00~12:20"
        case .t1300_1340: return "13:00~13:40"
        case .t1355_1415: return "13:55~14:15"
        case .t1430_1450: return "14:30~14:50"
        case .t1505_1545: return "15:05~15:45"
        case .t1555_1640: return "15:55~16:40"
        case .t1650_1710: return "16:50~17:10"
        case .t1720_1800: return "17:20~18:00"
        }
    }
    var models: [SessionModel] {
        switch self {
        case .t1000_1010:
            return [
                .init(track: .a,
                      title: "Today's Update")
            ]
        case .t1015_1035:
            return [
                .init(track: .a,
                      title: "大規模イベントアプリを支える技術〜長岡花火公式アプリを作った話〜",
                      description: "大規模なイベントアプリを支える技術のお話です。\n\n新潟県長岡市で開催される長岡花火の公式アプリを開発して、運用しています。コロナ禍では開催出来ませんでしたが、今年は久しぶりに開催される見込みです（6月現在）\n\n毎年開催期間合計で100万程度が来場する長岡花火に対して、どのような技術でアプリを運用して、長岡花火を支えているのか、お話できればと思います。\n\n意外なあれが役に立っています。\n\n普通のアプリとは異なり、イベントアプリは固有の課題があるため、イベントアプリを運用している方、今後イベントアプリを開発する方などの参考になればと思います。",
                      user: SessionUserType.user55.user,
                      archiveParameter: "iKzPgYRXKPo"),
                .init(track: .b,
                      title: "Xcode が遅い! とにかく遅い!! 遅い Xcode をなんとかする方法",
                      description: "Xcode が遅い。とにかく遅い!! あああ!!!\n\n皆さんはそんな経験ありませんか...?\n\niOS アプリの開発にはなくてなはならないツール、それは Xcode です。\n\nしかし、Xcode がとにかく遅いのです。\n\nアプリが成長し、ワークペースが巨大になり、多くのターゲットができるにつれてどんどん遅くなり、最後にはハングして終了すらできなくなってしまいます。\n\nこのセッションではそんな遅い Xcode を使えるように頑張った経験をもとに、Xcode のビルドの仕組み、そして Bazel などほかのビルドツールについても検証したいと思います。\n\n対象とする方:\n・Xcode が遅くて辛い方\n・大きなアプリを作っている方\n・killall XCBBuildService が癖になってしまった方\n・Xcode のビルドの仕組みをちょっと知りたい方\n\n前提とする知識:\n・Xcode",
                      user: SessionUserType.user56.user,
                      archiveParameter: "64UG469hQuE"),
                .init(track: .c,
                      title: "備えよう。HTTP/3 ",
                      description: "WWDC21の発表にあったように、iOS15でURLSessionのHTTP/3対応が実装されました。\n\nあれからもうすぐ1年経ちますが、2022年6月7日現在HTTP/3対応はデベロッパオプションとして提供されている段階で、大半のiOSデバイスにおいて有効化されてはいません。\n\nしかし、通信のパフォーマンスとセキュリティがより重要になってきていることを考えると、全てのデバイスでHTTP/3のサポートが有効になる日はそう遠くないかと思います。\n\nこのトークでは、「そもそもHTTP/3って何？QUICとどう違うの？」「どういう状況でメリットがあるの？」などの疑問にお答えしつつ、運用しているサービスの大半のWebAPIを事前にHTTP/3に対応させた事例から、HTTP/3対応の際に考慮すべき事項や、対応リリース後のモニタリングの想定など、来るべき日に備えた準備の知見をお話しします。",
                      user: SessionUserType.user57.user,
                      archiveParameter: "b6DrQU6Ertc"),
                .init(track: .d,
                      title: "iOSにおけるWakeword検知機能の実装",
                      description: "株式会社エクサウィザーズが提供する介護記録アプリ「CareWiz ハナスト」は、フォアグラウンド状態において有効な独自のWakeword検知機能と音声によるアプリ操作機能を備えています。\n\nWakeword検知を行うためには常時音声を取得する必要性があり、独特な実装を行い問題に対処する必要があります。\n\n本セッションでは、Wakeword検知機能の実装を中心に下記の内容をお伝えする予定です。\n\nWakeword検知\n・Wakeword検知の方法\n・アプリでの実装\n・SoundAnalysisを用いた精度向上\n\n常時録音に伴う問題と対応\n・イヤホンの脱着などの音声インプットの変更\n・電話などによる中断\n\n音声によるアプリ操作\n・音声とアプリの操作の連携\n・Wakewordから自由発話認識への連携",
                      user: SessionUserType.user58.user,
                      archiveParameter: "KZgnH0IMP68"),
                .init(track: .e,
                      title: "ホーム画面を無効化しアプリの切替えを抑止する技術 ",
                      description: "iOS端末を業務利用する場面では、ときおり「開発するアプリ以外を使わせたくない」「ホーム画面に遷移させたくない」という要望に出くわすことがあります。例えば、キオスク端末としてiPadを使うような場合です。\n\n本トークでは、そうした要望を満たすiOSの仕組みを3つ紹介します。\n\n・Guided Access・Single App Mode\n・Autonomous Single App Mode (ASAM)\n\nそれぞれの前提条件やメリット・デメリット、設定方法や使いどころを比較しながら解説します。3つ目のASAMは、アプリ内から Single App Mode のON/OFFを制御できる興味深いモードで、その実装方法についても紹介します。",
                      user: SessionUserType.user59.user,
                      archiveParameter: "H19AfkIzR68")
            ]
        case .t1050_1110:
            return [
                .init(track: .a,
                      title: "Feature Flagを使った開発で高速でストレスフリーなデリバリーを実現する ",
                      description: "アプリの新機能開発では「リリースが施策開始時期と合わない」「Mainブランチと差分が広がり競合が発生する」「不具合等で元に戻すには差分を丸ごとRevertする」などの点が開発・デリバリー速度低下の要因となります。\n\nこの状況を改善するためRettyではFeature Flagを導入しました。これはコードに分岐を設け機能表出を切り替える手法で、必要差分を予め隠した状態でリリースし、フラグ反転によって瞬時に表出することができます。\n\nFeature Flagによって競合が起きにくくなる他、静的解析で分岐の特定が容易となり、さらに機能停止も手軽に行えます。\n\nこのトークでは、RettyでのFeature Flagの実装・運用方法、導入に役に立つライブラリをご紹介します。明日から高速でストレスフリーなデリバリーを実現しましょう！",
                      user: SessionUserType.user60.user,
                      archiveParameter: "Pe8N3cJLqZo"),
                .init(track: .b,
                      title: "即時通知を導入する際に考えるべきこと",
                      description: "iOS 15から、即時通知と呼ばれる新しい通知が導入されました。これは、一定時間内に必ず確認してほしい情報を知らせる際に利用するもので、同じくiOS 15から導入された通知要約や集中モードを突破してユーザーの目に届く強力なものです。便利な反面、乱用するとユーザーに機能そのものをオフにされてしまう可能性があるため、使い所は精査する必要があります。\n\nまた、一度プロダクトに導入すると、その便利さ故つい使用箇所を増やしたくなってしまう可能性が高いですが、無論そういうわけにはいきません。安易に強力な通知配信を増やさないためには、開発メンバーの中で同じインプットが必要です。\n\n本セッションでは、一iOSユーザーとして即時通知を受け取ってきて再考する即時通知の使いどころ、実際にプロダクトに即時通知を導入してみて見えてきた、即時通知利用に関して開発メンバーでもつべき共通認識について導入事例と共にお話します。",
                      user: SessionUserType.user61.user,
                      archiveParameter: "W1oIP_4Lfl8"),
                .init(track: .c,
                      title: "SwiftUI in UIKit で開発する世界",
                      description: "【概要】\nSwiftUIが登場してから３年が経とうとしています。\n\n古いOS対応もあり、すぐに導入できなかったアプリも多かったでしょう。そんな中、新規のアプリを全てSwiftUIで構成した例も増えてきました。\n\nしかし、現実問題として既存の多くのアプリはUIKitで構成されています。この資産を活かしつつ、どのようにSwiftUIと歩んでいくのかを考えていく必要があります。\n\n今回はそんな悩みを抱えつつ、私達のプロダクトで行なってきた共存の仕方をご紹介していきます。\n\n【目次】\n1.SwiftUIとUIKit\n- SwiftUIの強みと弱み\n- 実装判断の基準\n- 責務の分け方\n\n2.アーキテクチャー\n- 既存のアーキテクチャー\n- SwiftUIとUIKitのアーキテクチャー共存\n\n3.課題\n- 共存の向き・不向き\n- 車輪の再発明\n- 実装において注意すべき点\n\n※内容が前後する可能性があります",
                      user: SessionUserType.user62.user,
                      archiveParameter: "6nWnQVRVcs0"),
                .init(track: .d,
                      title: "動画だけじゃない！iOS 15のピクチャ・イン・ピクチャを使って好きなUIを表示させよう！ ",
                      description: "iOS 14まではピクチャ・イン・ピクチャ（以下PiP）を表示させるには動画コンテンツが必要でした。\n\nしかし、新しくiOS 15でPiPのAPIが追加されたことにより動画コンテンツが無いただのUIViewもPiPとして表示させることが可能になりました！\n\nこれまでPiPを利用したアプリを3つリリースしてきた経験から、PiPを利用したアプリの開発からリリースするまでについて話したいと思います。\n\n・PiPに好きなUIを表示させる仕組みと実装\n・より良いPiP体験の提供\n・PiPでできないこと\n・Appleの審査を通過する\n\nPiPを使うことでユーザーにより良い体験を与えることができるアプリはたくさんあると自分は感じています。\n\nぜひこのセッションで得た情報をもとにPiPを使った良いアプリが増えれば良いと願っています！",
                      user: SessionUserType.user63.user,
                      archiveParameter: "T7XoScgrwO0"),
                .init(track: .e,
                      title: "20分でわかる！速習resultBuilder",
                      description: "皆さんはresultBuilderを使った事があるでしょうか。\n\nSwift5.4で導入されたこの技術はConcurrencyの発表で少し影が薄くなりましたが、実は複雑な処理をシンプルかつ宣言的なものに置き換えられるとても便利な技術です。実際、私たちのチームではこれを用いることで、メンテコストの高い実装部分を大幅に改良する事が出来ました。\n\n本トークではresultBuilderとは何なのか、またどういう効果的な利用法があるのかを実際の導入事例を交えてご紹介致します。21分後にはあなたも1人前のresultBuilder！\n\nコンテンツ\n・resultBuilderとは\n・仕組みと実装方法\n・プロダクション導入の実例やライブラリの紹介\n・高度な活用方法\n\n聞き手の想定\n・resultBuilderの存在を知らない方\n・存在は知っているけど使い方がわからない方\n・活用イメージが湧かない方",
                      user: SessionUserType.user64.user,
                      archiveParameter: "PuOXjIUVw3Y")
            ]
        case .t1125_1145:
            return [
                .init(track: .a,
                      title: "全力疾走中でも使えるストップウォッチアプリを作る",
                      description: "0.01秒が結果を左右する陸上競技の世界ではタイムはとても大切なものであり、日々の練習でもストップウォッチは欠かせません。\n\niPhoneにもストップウォッチがありますが、陸上競技の現場では画面上にあるボタンを押すことの難しさが致命的な欠点となり、実用に耐えないのが現状です。\n\nそんな問題を解決するために音量ボタンで制御可能なストップウォッチアプリを作成したところ、App Store Reviewガイドライン違反で公開が停止…\n\nどうすれば物理ボタンを使わずに全力疾走中でも使えるストップウォッチが作れるのか？\n\nストップウォッチのUXを最大限に高めるために検証した様々な対策を陸上競技歴15年の私が紹介します。\n\n目次（予定）\n・なぜ物理ボタンを使ってはいけないのか？\n・実際に作ってみた\n　a.近接センサーを使う\n　b.加速度センサーを使う\n　c.音を使う\n　d.etc\n・結果：一番良いインタラクションは？",
                      user: SessionUserType.user65.user,
                      archiveParameter: "rZ9vj2_rR88"),
                .init(track: .b,
                      title: "サーバーと同期してリアルタイムに更新する画面を実装する",
                      description: "アプリで画面を更新するためのトリガーとしてポピュラーなものは\n\n・Pull-to-refreshなどのユーザーの明示的なアクション\n・サーバー上などのデータが更新されたタイミング\n\nの2種類に大きく分類できます。\n\nユーザーの明示的なアクションで画面更新する場合は比較的シンプルに実装することが可能ですが、サーバー上のデータが更新されたタイミングに同期して画面更新を行う場合、更新通知を受け取る方法やUI更新方法など、考慮することが増えて実装が複雑になりがちです。\n\nそこでこのトークでは、リアルタイムでの更新が必要となる具体例を紹介した後に、サーバー上のデータをリアルタイムで同期するための設計/実装について、Firebaseを用いる手法、Push通知を用いる手法、WebSocketを用いる手法など、複数の手法の比較を行い、いかにしてリアルタイムで更新する画面を実装するかの解説を行います。",
                      user: SessionUserType.user66.user,
                      archiveParameter: "E5L79sf8o6M"),
                .init(track: .c,
                      title: "OSSのアプリケーションを開発「し続ける」ための哲学",
                      description: "自分達のアイデアを形にして新しいサービスをラウンチするのは興奮するものですし、さらにそれを軌道にのせてマネタイズするまでのノウハウは開発者の成功の証として世に溢れています。一方、アプリケーションの開発を「続ける」ことは、そのような華々しさとは縁遠く、かつフリーウェアとなれば生計を立てる外でそれを実行する必要があります。\n\n発表者は2014年にOSSのmacOSアプリケーションCotEditorの開発を引き継ぎ、以来おおよそ月に1回のリリースを8年以上続けています。OSS開発を続けるということはどういうことなのか、どうモチベーション維持をするのか、このトークではそんなCotEditorプロジェクトを続けている哲学を紹介します。\n\n以下のような話を含みます：\n・開発の基本方針\n・開発を続けるモチベーション\n・ユーザからのフィードバックとの付き合い方",
                      user: SessionUserType.user67.user,
                      archiveParameter: "YGJZ7w4cQts"),
                .init(track: .d,
                      title: "シーンに応じた使いやすいQRコード読み取り機能を実装しよう",
                      description: "iPhoneが登場して以降、QRコードを読むという行為はありふれた行為となりました。\n\niOSにおいては\n\n・古くからカメラからのインプットを扱えるAVFoundationを用いて\n・新しくは画像解析フレームワークであるVisionを用いて\n\nQRコードを読むという機能は比較的簡単に実現できます。\n\nしかし、QRコードを読み込むシーンというのはアプリによって様々です。\n\n例えば\n\n・１つのQRコードをしっかり読み込みたい\n・リッチな表現でQRコードを読み込みたい\n・夜や倉庫の中といった暗い場所でもQRコードを読み込みたい\n・連続で複数のQRコードを読み込みたい\n\nなどなど。\n\n本セッションではシーンに応じてQRコードを気持ちよく読み取るためにした工夫をお話します。頻繁に使う機能だからこそ体験の良いQRコード読み込みを実現していきましょう！",
                      user: SessionUserType.user68.user,
                      archiveParameter: "-HZsYjDnYMs"),
                .init(track: .e,
                      title: "モバイルアプリのオブザーバビリティを向上させるプラクティス",
                      description: "近年、SRE（Site Reliability Engineering）の手法をアプリケーションにまで拡大しようといった動きが盛んです。\n\nしかし、実際にモバイルアプリの可観測性≒オブザーバビリティを向上させるためには、ネイティブエンジニアの専門性が求められる場面が多く、あまり実際に効果のあった事例が共有されていないように感じます。\n\nこのトークでは\n\n・アプリ内で計測される指標を用いてSLI / SLOを構成する\n・アプリ内でのレスポンスのパースエラー検知\n・問い合わせ調査のオブザーバビリティ向上\n・外部SNSの認証サービスの障害検知\n・App Store Connect API 、MeticKitの活用\n\nといった実際にチームで効果のあったプラクティスを紹介したいと思います。",
                      user: SessionUserType.user69.user,
                      archiveParameter: "4X3Nrm-A3lA")
            ]
        case .t1200_1220:
            return [
                .init(track: .c,
                      title: "LINE iOSのビルド環境の変遷",
                      description: "LINE iOSは、200万行を超えるソースコードと200以上のモジュールで構成されている大規模なプロジェクトであるため、そのビルド時間も長くなりがちです。\n\n私達はビルド時間の改善の一環として、Bazelを取り入れました。その結果、ビルド速度が2倍になるというメリットを享受しましたが、メンテナンスコストが増大するというデメリットにも直面しました。\n\nこのセッションでは2年間Bazelを使い続けて分かったBazelの長所やリスク、運用時の注意点、そしてLINE iOSのビルド環境の現状と今後についてご紹介します。",
                      user: SessionUserType.user70.user,
                      archiveParameter: "6w8JWtvD1yE",
                      isSponsor: true),
                .init(track: .d,
                      title: "デザインシステム",
                      description: "Wantedly では、「デザインの生産性を向上させ、デザイナ - エンジニア 間コミュニケーションを改善することで、ユーザに価値を届ける速度を向上させる」ことを目的として UI デザインシステムを作っています。\n\n今回は現場で運用されているデザインシステムと iOS 実装の成功と失敗について以下の内容を話します。\n\n・Wantedly の UI デザインシステムとはなにか\n・コンポーネントリストではなく「共通の考え方とツール&アセット」\n・Figma 実装から考える iOS 実装のインターフェース設計\n・チームへの普及の成功と失敗",
                      user: SessionUserType.user71.user,
                      archiveParameter: "HJn9cqaiP-g",
                      isSponsor: true),
                .init(track: .e,
                      title: "「家族アルバム みてね」を支えるiOSビルド環境の改善",
                      description: "iOSのビルド環境はXcodeやSwift Package Managerのアップデート、新しいMacの登場などによって毎年変化を遂げています。\n\nサービス提供を開始した2015年から現在に至るまで、これらの変化に合わせて継続的にビルド環境の改善が行われてきました。\n\n本セッションでは2021年以降に実施したビルド環境の改善についてご紹介し、今後の目指す姿についてお話いたします。\n\n・Swift Package Managerの活用とライブラリ整理\n・Apple Silicon対応\n・マルチモジュール化\n・ビルド時間改善",
                      user: SessionUserType.user72.user,
                      archiveParameter: "oD1XniM3SDA",
                      isSponsor: true)
            ]
        case .t1300_1340:
            return [
                .init(track: .a,
                      title: "Swift Concurrency時代のiOSアプリの作り方",
                      description: "昨年、Swift Concurrencyが導入されました。当初はiOS 15のみでサポートされていましたが、Concurrencyのback deploymentが実現されたため、iOS 13以降であれば今すぐにでもConcurrencyを取り入れることができます。\n\nしかし、実際にConcurencyを取り入れようとすると、参考となる情報はまだまだ少ないのではないでしょうか。Conccurency自体の情報は豊富でも、iOSアプリ開発での活用、特にactorや単体テストなどについてはほとんど語られていないように思います。\n\n本トークでは、iOSアプリ開発におけるConcurrency活用の一つのベースラインとなることを目指して、async/awaitやTask、actor、MainActorなどを、アプリやテストのコードにどのように取り入れるか、具体例を用いて紹介します。",
                      user: SessionUserType.user73.user,
                      archiveParameter: "kvpsphJm9lE"),
                .init(track: .b,
                      title: "Effective PencilKit / 新聞スクラップ体験の実現",
                      description: "WWDC 2019 で発表された PencilKit を利用することで、数行のコードで 標準メモアプリと同様の手描き体験をアプリに導入できます。\n\n発表に先立ち、日本経済新聞社の紙面ビューアーアプリでは、Apple Pencil を用いた紙面画像にメモやハイライトを書き込める機能をリリースしました。\n\nアプリの機能要件を満たすための独自拡張の実現には、様々な制約が立ちはだかりました。\n\nたとえば、キャンバスに画像を載せる、ズームやスクロールなどビューアーとしての操作は残しつつ書き込みを一時的に無効にするなど、一見すると単純そうですが一筋縄ではいきません。\n\n本セッションでは PencilKit の開発ノウハウを、ドキュメントと内部の動きから洞察した知見の両面から解説します。開発経験を踏まえ、紙の新聞に書き込みを行うユーザー体験をどのようにアプリへ落とし込んでいったか説明できればと思います。",
                      user: SessionUserType.user74.user,
                      archiveParameter: "0p6hlEstjMY"),
                .init(track: .c,
                      title: "The state of Swift for WebAssembly in 2022 ",
                      description: "SwiftのWebAssembly対応を進めている、SwiftWasmというプロジェクトがあります。\n\n現在、WebAssemblyはWebブラウザ上の用途だけでなく、「複数言語からコンパイルできて様々な環境で動く高速なプログラム」として、エッジコンピューティングやIoT、ブロックチェインにおけるスマートコントラクトなど、様々な分野で用途が模索されています。\n\nもし将来的にWebAssemblyが覇権を取った場合、そこでSwiftが活躍できるポジションはあるのでしょうか？\n\nこのトークでは、Wasm対応によって達成できる未来、プロジェクトの最新状況と課題、実際の活用事例を紹介したいと思います。\n\nAppleプラットフォーム以外でのSwiftの活用に興味のある方には、特に楽しんで頂ける内容になる予定です。",
                      user: SessionUserType.user75.user,
                      archiveParameter: "e38XVpqs1u0"),
                .init(track: .d,
                      title: "react-reconcilerでオレオレReact Nativeを作ろう！",
                      description: "Reactの思想であるLearn Once, Write Anywhereを推し進めるため、React内部にはReactをどこでも動かせるようにするreact-reconcilerというパッケージが存在します。\n\nreact-reconcilerはReact DOMやReact Nativeで利用されているUIの差分検出処理のパッケージで、JSXで書かれたコンポーネントのマウントや更新通知を受け取れます。これを使って独自のレンダラーを作ってみましょう。\n\nこのトークでは、react-reconcilerのレンダラーをSwift(UIKit)で実装して自分だけのReact Nativeを作る方法について話します。",
                      user: SessionUserType.user76.user,
                      archiveParameter: "zXhVYe2fUnQ")
            ]
        case .t1355_1415:
            return [
                .init(track: .b,
                      title: "モバイルアプリの行動ログの「仕込み」を快適にする",
                      description: "ここでの「行動ログ」とは、特定の画面の表示、ボタンのタップなど、ユーザー操作を起点に送信するものを指します。集めた行動ログは、サービス開発上の分析や実態把握に役立ちます。\n\nアプリ開発者は、そのログを仕込む役割を担いますが、しばしば課題にぶつかります。\n\n・いざ分析するとき「ログが足りない！」\n　・「QA時にログ送信、網羅した？」\n　・そもそもログ要件が十分に練られていない……\n・……\n\n本セッションでは、行動ログにまつわる悩みの種のうち、ログ実装の「仕込み」にフォーカスして、ミスを防ぐ仕組みや工夫の事例をご紹介します。\n\nトピック\n\n・ドキュメントをベースにした型安全なログ実装コード自動生成\n・iOS 14以降で使いやすくなった Logger APIの活用\n・QA作業を踏まえたログ実装網羅チェッカー\nなど",
                      user: SessionUserType.user77.user,
                      archiveParameter: "4NGvI9PoAIQ"),
                .init(track: .c,
                      title: "目からビームでヴィランをやっつける 〜ARKitの知られざる並走機能〜",
                      description: "ARKitが持つ多くの機能の中でも、みなさんはフロントカメラとバックカメラを同時に使用することによるフェイストラッキングとワールドトラッキングの並走機能をご存知でしょうか？\n\n実はこの機能、Human Computer Interaction（HCI）の研究者たちの注目を集めたアツい機能なんです。この機能により、視線を向けるだけで目の前のコーヒーメーカーがコーヒーを淹れてくれるような、これまでにスマートフォン1台ではできなかった体験を実現することが可能となりました。\n\n本トークでは、この並走機能に新たな可能性を感じた私が実際に作ったいくつかのサンプルアプリの紹介やそこで得られた知見の共有をします。\n\n・視線を向けるだけで電気を点けたり、コーヒーを淹れられるアプリ\n・目からビームを発してヴィランをやっつけるアプリ\n・ユーザが暗い表情をしていると、辺りに花が咲きほこるアプリ",
                      user: SessionUserType.user78.user,
                      archiveParameter: "9obVL8bRKMM"),
                .init(track: .d,
                      title: "iOS15からのCommunication NotificationとSiri ",
                      description: "iOS15からユーザー間でのやりとりのための新しい通知、Communication Notificationが導入されました。\n\nそうです、通知にユーザーのアイコンが出るあの通知です。\n\nUIが変わったり、通知の要約を突破できたりと普通の通知よりも便利なこともある一方、Siriに関する知識が必要になってきます。\n\nしかしSiriに関してはドキュメントも知見も少なく、その割に設定する項目も多く、敷居が高いイメージもあるのではないでしょうか？そもそもなぜ通知の実装にSiriが出てくるのでしょうか？\n\nこのトークではCommunication Notificationの実装方法、Communication Notificationを実装する上でのSiriの知識、及びよくやってしまいがちなCommunication Notificationのアンチパターンなどを紹介していきます。",
                      user: SessionUserType.user79.user,
                      archiveParameter: "YB0ljII-mtY")
            ]
        case .t1430_1450:
            return [
                .init(track: .b,
                      title: "キャッシュによる状態管理のアーキテクチャ ",
                      description: "例えばTwitterアプリでは、ツイートに押したいいねは他のどの画面に表示される同一のツイートにも反映されています。\n\nこのような体験を実現する上で、グローバルステートとして状態を管理する手法がしばしば用いられ、iOSアプリ開発でもReduxから派生するTCAが例として挙げられます。\n\nしかし、そもそもこのグローバルステートで管理する大抵の状態はサーバーからのレスポンスであることから、WebフロントエンドではReact QueryやSWRを筆頭にサーバーデータのキャッシュによる状態管理が流行しつつあります。\n\nそこで本トークでは、SwiftUIを用いたiOSアプリ開発におけるサーバーデータのキャッシュによる状態管理のアーキテクチャについてお話しします。",
                      user: SessionUserType.user80.user,
                      archiveParameter: "uPmb6AyaGlU"),
                .init(track: .c,
                      title: "watchOSにおけるバックグラウンドタスクの限界",
                      description: "Appleが提供している中で最もバックグラウンドタスクが重要なプラットフォーム、それがwatchOSです。\n\n操作は両腕を上げる必要があるので短時間で済ませたいですし、ワークアウトのような長時間のタスクはそもそも待っていられません。\n\nそんなwatchOSのバックグラウンドタスクは2016年に開発者へ解禁されて早6年、日々進歩してきました。watchOS 9でも新しい機能が追加されるようで、更なる進化が期待できます。\n\n本セッションでは以下のテーマについてお話しすることで、今のwatchOSアプリでどこまで出来るのかを理解する手助けになればと思います。\n\n・バックグラウンドでできること、できないこと\n・端末の世代やバッテリー残量などの環境によって受ける影響\n・どのようにバックグラウンドタスクを設計すべきか\n・watchOS 9から追加される新機能",
                      user: SessionUserType.user81.user,
                      archiveParameter: "QwrxtI2P5ek"),
                .init(track: .d,
                      title: "AirPlayの裏舞台",
                      description: "みなさん、AirPlay使いこなしていますか？\n\nAirPlayはAppleのデバイスから映像や音楽をApple TVや対応スマートテレビ・スピーカーで再生できる機能です。\n\n発表当初から複雑な設定なしで直感的に使えるようにAppleらしい設計が行われ、ユーザーにその裏側で何が起きているのかを意識させることがほとんどないようにデザインされています。\n\n2018年にAirPlay 2が発表されて以降は対応デバイスも増え、またSiri連携や接続先デバイスの学習によりますます使いやすくなって来ました。\n\n本トークではAirPlayで可能になる体験やアプリへの組み込み方法、他のキャスト技術との比較といった内容の他、その仕組みの裏でどんな通信が行われているのか？まで踏み込んでお話しできればと思います。",
                      user: SessionUserType.user82.user,
                      archiveParameter: "3_RDSccgGBg")
            ]
        case .t1505_1545:
            return [
                .init(track: .a,
                      title: "CarPlay向けのアプリって開発できるの？ ",
                      description: "CarPlayを利用したことはありますでしょうか。\n\nCarPlayはiPhoneがあるだけで登録した地点までのナビをする、好きな音楽を再生するなど、車をすぐに自分の空間にすることができます。\n\n便利なCarPlayですが、ハードルが高く実際に触ってみたりアプリを作る機会は少ないのではないでしょうか。ですが最近はiPhoneを繋いで動作するシミュレータや、安価なカーオーディオがあったりします。\n\nまたUIもTemplatesが用意されていたり試すのは意外と簡単だったりします。\n\n本LTでは、CarPlayの開発に必要な知識を振り返りつつ、簡単なアプリを動かせたらと思います。\n\n[ゴール]\n・CarPlayに興味が湧いて触ってみようかな、という気になる\n\n[アジェンダ]（検討中）\n・CarPlayとは\n・開発するために・・\n・シミュレータを触ってみよう\n・簡単なアプリを作ってみよう",
                      user: SessionUserType.user84.user,
                      archiveParameter: "OOjL6bsageM",
                      isLT: true),
                .init(track: .a,
                      title: "JailBreakと向き合おう",
                      description: "昔はiOSのJailBreakはよく行われていましたが、最近はiOSのアップデートによりJailBreakは少なくなったような印象です。\n\nとはいえ何もしないのではなく、やれることはやっておいたほうがいいと思います。\n\n本LTでは、JailBreakはどのような手段があるのか、アプリはどのような対策ができるのか、自分なりに調べた結果を共有したいと思います。",
                      user: SessionUserType.user83.user,
                      archiveParameter: "QDLqh0U-Lzo",
                      isLT: true),
                .init(track: .a,
                      title: "鉄道アプリを支えるテクノロジー",
                      description: "東急株式会社・東急電鉄株式会社では東急東横線や田園都市線などの鉄道をより便利にお使いいただくために「東急線アプリ」を提供しています。\n\nこのLTでは\n\n・アプリと連携する駅、線路、車両などのハードウェアについて\n・アプリと連携する線路信号システム、運行情報システムの技術\n・アプリ上でリアルタイムデータ更新するためのアーキテクチャ\n\nなど\n\n普段知る機会の少ない鉄道のテクノロジーとiOSアプリでの活用についてご紹介します。",
                      user: SessionUserType.user85.user,
                      archiveParameter: "Sweu3XF-JfA",
                      isLT: true),
                .init(track: .a,
                      title: "Flutterアプリ開発にネイティブコードはどこまで求められるのか",
                      description: "2018年に登場したFlutter。\n\nきっと当時は「またクロスプラットフォームフレームワークが出てきて、廃れていくのか？」と思った方もいると思いますが、今では様々なアプリで使われるようになりました。弊社の新規アプリ「Famm プリント」もFlutter製アプリの一つです。\n\n「Flutter流行ってるし、そろそろ手を付けてみようかな」\n「でも結局各プラットフォームのネイティブコード呼ばなきゃいけない場面出てきたりしない…？」\n\nそんなことを思っている人もいるのではないでしょうか？\n\nこのトークでは、実際にFlutter製アプリを作ってみてネイティブコードを書いた場面はあったのか、ネイティブコードを書くことを求められるのはどんな場面かを話したいと思います。このトークによって、Flutter開発を躊躇していた方の背中をポンと押せたら幸いです。",
                      user: SessionUserType.user86.user,
                      archiveParameter: "9vy26rZB1kA",
                      isLT: true),
                .init(track: .a,
                      title: "VisionKitを使ってクレジットカードスキャナーを作る話",
                      description: "iOS13から追加されたVisionKitフレームワークの物体認識、OCR(Optical character recognition)など一部機能を使うとこで簡単にクレジットカードの番号を読み込む機能をゼロから作ることができます。\n\n・VNDetectRectanglesRequest -> カードの形を認識\n・VNRecognizeTextRequest -> カード番号、有効期限、名前の読み込み(ocr)\n・パーシングして使えるかを判定\n\nその他、認識制度を上げるためのアイディアについて話します！",
                      user: SessionUserType.user87.user,
                      archiveParameter: "NwtWuZ2BrlU",
                      isLT: true),
                .init(track: .a,
                      title: "iPhoneでサッカースタジアムをスキャンしVPSを動作させるには",
                      description: "Visual Positioning Systemは周りの風景の情報を元に現実空間の中で自身の位置を特定する技術です。\n\n私はサッカーJ2リーグの町田ゼルビアのホームスタジアム「町田GIONスタジアム」にてiPhoneで数百枚画像撮影して点群作成し、VPS機能を用いてAR表現を実現しました。\n\n・Immersal での点群作成\n・実際のスキャンの様子\n・数回の実作業を経て得た生成物\n・VPSを用いて実現したAR表現\n\nそもそもiPhoneでスタジアムに立ち向かえるのか！\n\nスタジアムでの現地作業という貴重な経験から得た知見を共有し、そこでどんな表現が実現できたのか画像と映像と共に熱く解説します。",
                      user: SessionUserType.user25.user,
                      archiveParameter: "bcu8KM7AsdQ",
                      isLT: true)
            ]
        case .t1555_1640:
            return [
                .init(track: .a,
                      title: "サポートiOSバージョンを定期的にあげる仕組みづくり ",
                      description: "サポートOSバージョン、どんどんあげていきたいですよね？\n\nしかし、サポートバージョンを減らすとユーザーも減るため、プロダクトオーナーに渋られることもよくあります。\n\n加えて、開発の現場では「サポートOSバージョンあげたいけど、結構気合で解決できるし……」というエンジニアと、「エンジニアから要望も来ないから、あげなくてもいいか」というプロダクトオーナーという、お見合い状態になることもあります。\n\n実はサポートOSバージョンをあげてもよさそうなのに、キッカケがない……そんなことはありませんか？\n\nこのトークではこういった課題を解決するため、\n\n・アクティブユーザーのOSバージョン割合で判断するのは悪手！？本当に見るべき指標\n・定期的にサポートOSバージョンアップを検討できるキッカケの仕組み\n\nについて話します。\n\nこのトークが皆さんのアプリのサポートOSバージョンアップにつながると嬉しいです。",
                      user: SessionUserType.user89.user,
                      archiveParameter: "_XNsLEdNfLk",
                      isLT: true),
                .init(track: .a,
                      title: "大学で出席管理アプリ・掲示板閲覧アプリを開発・運用している学生の話",
                      description: "現在、愛知県の大学で大学側と協力し、出席管理アプリ・掲示板閲覧アプリを開発・運用している学生です！\n\n出席管理アプリは教室内に設置されたBLEビーコンを用いて位置推定を行い、授業に出席登録できるアプリであり、掲示板閲覧アプリは学生掲示板をスマートフォンから閲覧できるアプリです。どちらもAppStoreにて公開・運用しております。\n\nこのLTではこれらのアプリで用いている技術や運用を紹介しますので「エンターテイメントとほんの少しの知見共有」として聞いていただければ幸いです。\n\nまた、大学に出席管理アプリ・掲示板閲覧アプリがない学生の皆さんへ\n「皆さんも大学のアプリを開発し、学生生活をよくしよう！！！！」というメッセージとなればいいなと思っています。\n\n対象とする人:\n・学生でiOS開発をしている人\n学生のアプリ開発の話を温かい目で見てくださる方",
                      user: SessionUserType.user90.user,
                      archiveParameter: "n1B5MuaHVes",
                      isLT: true),
                .init(track: .a,
                      title: "GDPR or 'similar' statute",
                      description: "皆さんはGDPRという単語を聞いたことがありますか？\n\nはい、ヨーロッパの個人情報に関する法律ですね。ここで審査ガイドラインを見てみましょう。\n\n> the European Union's General Data Protection Regulation (GDPR) or similar statute\n\nそう、GDPRのような法律はGDPRだけではないのです。GDPRさえ、ヨーロッパさえチェックしておけばいいなんてことはありません。個人情報保護規定はどの国にもあるのです。\n\n本LTでは、保護規程といえばまずはGDPR！な皆様と一緒に他国における類似の規定について学びます。\n\n話すこと\n\n・アプリ審査ガイドラインの振り返り\n・GDPRの振り返り\n・2022年6月1日🇹🇭\n・JETROが注意喚起してるって知ってた？ \n\n話さないこと\n\n・法律への対処手段（専門家に聞いてください！）",
                      user: SessionUserType.user91.user,
                      archiveParameter: "YEsFHu9hh7w",
                      isLT: true),
                .init(track: .a,
                      title: "今更だけどUIKitで型パラメータのインジェクトを利用してViewのレイアウトをしてみよう ",
                      description: "似たようなレイアウトのViewがいくつかあった場合に、どのように実装しますか？\n\nenumでtypeを定義してtypeごとにレイアウトを分岐したり、ベースクラスを作ってサブクラス側でレイアウトに必要な処理を行なったりなど、様々な実装方法があるかと思います。\n\n本トークでは、実際にサービスで運用されているデザインを題材に、型パラメータのインジェクトを利用したViewのレイアウト方法についてお話します。\n\n他のレイアウト方法とは、どういった違いがあるかなどもお話できればと思います。",
                      user: SessionUserType.user92.user,
                      archiveParameter: "pRL_O6FJe60",
                      isLT: true),
                .init(track: .a,
                      title: "SceneKit AND SwiftUI ",
                      description: "SceneKit は３次元空間で物理シミュレーションなどの複雑なアニメーションを可能とする Framework です。ですから ARKit を利用したアプリやゲームアプリなどの開発を行わない開発者にとっては遠い存在にも感じるかもしれません。\n\nしかし、紙吹雪アニメーションなど、一定のランダム性を必要とする場面では Core Animation にも限界が来てしまいます。そんなときに便利なのが SceneKit です！\n\n・寄付アプリ「dim.」での実例紹介\n・SwiftUI で SceneKit を利用\n・SceneKit で iOSDC を表現（リアルタイム実装）\n\nこのトークでは、SceneKit の活用事例をご紹介するとともに、5分という制限時間内で SceneKit を用いた機能をリアルタイムで構築します。トーク終了後には SceneKit の虜になっていること間違いなしです！",
                      user: SessionUserType.user93.user,
                      archiveParameter: "5zuLD1a_J_8",
                      isLT: true),
                .init(track: .a,
                      title: "iPadOSDC Japan 2022",
                      description: "「お前も Swift Playgrounds を使った開発者にならないか？」\n\n「見れば解るお前の強さ。Xcode だな？」\n\n「その闘気。練り上げられている。熟練の開発者に近い」\n\n「やはり Swift Playgrounds を使った開発者になれ！俺と iPad で開発を続けよう」\n\nSwift Playgrounds では、昨年末から iPad 上でアプリを開発してリリースできるようになりました。\n\n本セッションではそんな「ならない」と感じている人たちのために、Swift Playgrounds を使った iPad での開発を紹介します。\n\n「死ぬ…！！死んでしまうぞ　Swift Playgrounds を使った開発者になれ！！なると言え！！」",
                      user: SessionUserType.user62.user,
                      archiveParameter: "bn-m8aKzBRc",
                      isLT: true)
            ]
        case .t1650_1710:
            return [
                .init(track: .c,
                      title: "新卒は見た！ゆめみの実態！",
                      description: "他社だと「マジかよ！？」と驚くような制度や仕組みがゆめみにはたくさん存在します。有給取り放題や給与自己決定なども、ゆめみを代表する制度の一部です。\n\n「その制度って対外的なパフォーマンスでは？」と思う方もいるでしょう。私もゆめみに入社する前はそう思っていました。\n\n入社してわかった「ゆめみ事情」について、新卒の観点からお話しします！\n\n聞いてくださる方には、ゆめみについてもっと知っていただければ幸いです。",
                      user: SessionUserType.user94.user,
                      archiveParameter: "sjv1UQ1VRtc",
                      isSponsor: true),
                .init(track: .d,
                      title: "音声プラットフォーム「Voicy」のiOS開発について ",
                      description: "日本最大級の音声プラットフォームを運営するVoicyでは、リスナー向けアプリの「Voicy」とパーソナリティ向けアプリの「VoicyStudio」の2種類のアプリがあり、日々開発を進めています。\n\nさまざまな改善を重ねつつ、生放送、アプリ内課金などの新規機能をリリースしてきました。\n\n本セッションでは、改善を重ねつつ新規機能をリリースしている2つのアプリを開発しているVoicyの開発体制、プロセスについてご紹介します。",
                      user: SessionUserType.user95.user,
                      archiveParameter: "Pg5Db2oWwcs",
                      isSponsor: true),
                .init(track: .e,
                      title: "Parallel testing of iOS UI on a large scale",
                      description: "BitriseでAppleシリコンベースの仮想化CI/CD環境とビルドパイプラインの提供が開始され、より高速なiOSビルド及び並列UIテストが可能になりました。\nそれに加え、ビルドとテストパフォーマンス/安定性のデータを可視化するInsightsPROを利用すれば、よりエラーの少ない、安全なiOSアプリ開発ワークフローが実現できます。\n\n本トークでは、Bitriseの機能を活用して大規模なiOS UI並列テストの実現方法などCI/CDプロセスの高速化する方法を紹介します。\n\n・Appleシリコンベースの仮想化CI/CD環境 (M1 stack)によるビルド高速化\n・ビルドパイプラインの概要、及び導入によるiOS UI並列テストの実現方法\n・Insights PROによるアプリ開発ワークフローの改善方法\n\n本トークは英語で行う予定です。",
                      user: SessionUserType.user96.user,
                      archiveParameter: "Qdu7PV9u0AA",
                      isSponsor: true)
            ]
        case .t1720_1800:
            return [
                .init(track: .a,
                      title: "クロージング")
            ]
        }
    }
    
    static var models: [SessionModel] = SessionDay2Type.allCases.flatMap(\.models)
}
