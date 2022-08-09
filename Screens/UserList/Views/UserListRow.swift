import SwiftUI

struct UserListRow: View {
    
    let user: SessionUser
    let didTap: () -> Void
    
    var body: some View {
        SessionDetailUserView(
            user: user,
            didTapSns: didTap
        )
//        .frame(maxWidth: .infinity) // fix me for ipad
        .padding(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
    }
}
