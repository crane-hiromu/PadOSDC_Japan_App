import SwiftUI

// MARK: - NavigationLink
struct InfoNavigationRow<Destination: View>: View {
    let type: InfoType
    let destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: { InfoRowContent(type: type) }
        )
    }
}
