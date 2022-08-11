import SwiftUI

struct UserListRow: View {
    
    let user: User
    let didTap: () -> Void
    
    var body: some View {
        SessionDetailUserView(
            user: user,
            didTapSns: didTap
        )
        .padding([.leading, .trailing], 8)
        .frame(height: 40)
    }
}
