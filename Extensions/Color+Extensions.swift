import SwiftUI

extension UIColor {
    /// `secondarySystemBackground`と同じ
    /// ダークモードで色が変わってしまうので直接コードを指定する
    static let _secondarySystemBackground = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
}

extension Color {
    static let secondarySystemBackground = Color(UIColor._secondarySystemBackground)
}
