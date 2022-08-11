import SwiftUI

struct InfoRow<Destination: View>: View {
    
    let type: InfoType
    let action: (() -> Void)?
    let destination: Destination?
    
    var body: some View {
        switch type {
        case .about, .blog: 
            Button(action: { action?() }) {
                InfoRowContent(type: type)
            }
        case .staff, .speaker:
            NavigationLink(
                destination: destination,
                label: { InfoRowContent(type: type) }
            )
        }
    }
    
    init(
        type: InfoType,
        action: (() -> Void)? = nil,
        @ViewBuilder destination: @escaping () -> Destination? = { nil }
    ) {
        self.type = type
        self.action = action
        self.destination = destination()
    }
}

