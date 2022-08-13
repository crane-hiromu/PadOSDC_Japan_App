import SwiftUI
import UIKit

/*
 今回は小規模のアプリなので、`appearance`による変更を許容としている。
 */

// MARK: - Configurator
enum Configurator {
    
    static func configure() {
        configureTabBar()
        configureNavigationBar()
        configureSearchBar()
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
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
    }
    
    private static func configureSearchBar() {
        let _image = UIImage(systemName: "magnifyingglass")
        let image = _image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        UISearchBar.appearance().setImage(image, for: .search, state: .normal)
        
        let color = UIColor._secondarySystemBackground
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = color
    }
}
