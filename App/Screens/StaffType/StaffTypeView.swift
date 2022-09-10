import SwiftUI

// MARK: - View
struct StaffTypeView: View {
    let environment: StaffTypeEnvironment
    
    var body: some View {
        List(StaffType.allCases, id: \.rawValue) {
            NavigationRow(
                name: $0.title,
                destination: environment.router.routeToUserList(with: $0.users)
            )
        }
        .navigationBarTitle(L10n.userListNavTitleStaff, displayMode: .inline)
    }
}
