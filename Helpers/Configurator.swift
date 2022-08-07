import SwiftUI
import UIKit

enum Configurator {
    
    static func configure() {
        configureTabBar()
        configureNavigationBar()
    }
    
    private static func configureTabBar() {
        UITabBar.appearance().backgroundColor = UIColor._secondarySystemBackground
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    private static func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance // ラージタイトルの場合の外見
        UINavigationBar.appearance().standardAppearance = appearance // 通常の外見
        UINavigationBar.appearance().compactAppearance = appearance //横向きの場合
    }
}
