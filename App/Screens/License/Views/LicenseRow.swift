import SwiftUI

// MARK: - Row
struct LicenseRow<Destination: View>: View {
    let name: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: { Text(name)  }
        )
    }
}
