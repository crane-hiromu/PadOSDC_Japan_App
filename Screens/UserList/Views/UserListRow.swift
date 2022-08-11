import SwiftUI

struct UserListRow: View {
    
    let user: User
    let didTap: () -> Void
    
    var body: some View {
        SessionDetailUserView(
            user: user,
            didTapSns: didTap
        )
        .padding(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
    }
}
