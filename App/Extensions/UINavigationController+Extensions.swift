import UIKit

// MARK: - UINavigationController Extension
extension UINavigationController {
    
    /// 戻るボタンのタイトルを消す
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
