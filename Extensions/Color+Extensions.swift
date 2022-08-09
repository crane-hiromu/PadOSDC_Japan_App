import SwiftUI

extension UIColor {
    /// ダークモードで色が変わってしまうので直接コードを指定する
    
    /// `secondarySystemBackground`と同じ
    static let _secondarySystemBackground = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
}

extension Color {
    static let secondarySystemBackground = Color(UIColor._secondarySystemBackground)
}
