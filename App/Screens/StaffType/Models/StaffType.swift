import SwiftUI

// MARK: - Type
enum StaffType: Int, CaseIterable {
    case core, temporary, network
    
    private var name: String {
        switch self {
        case .core: return L10n.staffTypeNameCore
        case .temporary: return L10n.staffTypeNameTemporary
        case .network: return L10n.staffTypeNameNetwork
        }
    }
    
    var title: String { 
        "\(name)\(L10n.staffTypeTitleStaff)" 
    }
    
    var users: [User] {
        switch self {
        case .core:
            return CoreStaffUserType.allCases.map(\.user)
        case .temporary:
            return TemporaryStaffUserType.allCases.map(\.user).sorted { $0.name < $1.name }
        case .network:
            return NetworkStaffUserType.allCases.map(\.user).sorted { $0.name < $1.name }
        }
    }
}
