import SwiftUI

// MARK: - Row
struct NavigationRow<Destination: View>: View {
    let name: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: { label }
        )
    }
}

// MARK: - Private 
private extension NavigationRow {
    
    var label: some View {
        Text(name)
            .foregroundColor(.primary)
    }
} 
