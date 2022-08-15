import SwiftUI

// MARK: - View
struct EmptyView: View {
    let type: EmptyType
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: type.icon)
                .resizable()
                .frame(width: 60, height: 60)
            Text(type.message)
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: size.width, height: size.height)
    }
}

// MARK: - Type
enum EmptyType {
    case session
    
    var icon: String {
        switch self {
        case .session: return "exclamationmark.octagon"
        }
    }
    
    var message: String {
        switch self {
        case .session: return "該当するセッションが見つかりませんでした。"
        }
    }
}
