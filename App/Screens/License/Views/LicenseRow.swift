import SwiftUI

// MARK: - Row
struct LicenseRow<Destination: View>: View {
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
private extension LicenseRow {
    
    var label: some View {
        Text(name)
            .foregroundColor(.primary)
    }
} 
