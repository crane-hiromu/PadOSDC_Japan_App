import Foundation

// MARK: - Model
struct SessionModel: Identifiable {
    let id: UUID
    let track: TrackType
    let title: String
    let description: String?
    let user: SessionUser?
    let isSponsor: Bool
    let isLT: Bool
    
    init(
        id: UUID = .init(),
        track: TrackType,
        title: String,
        description: String? = nil, 
        user: SessionUser? = nil,
        isSponsor: Bool = false,
        isLT: Bool = false
    ) {
        self.id = id
        self.track = track
        self.title = title
        self.description = description
        self.user = user
        self.isSponsor = isSponsor
        self.isLT = isLT
    }
}

// MARK: - Internal
extension SessionModel {
    
    func contains(query: String) -> Bool {
        title.lowercased().contains(query.lowercased())
        || (description?.lowercased() ?? "").contains(query.lowercased())
        || (user?.name.lowercased() ?? "").contains(query.lowercased())
        || (user?.twAccount?.lowercased() ?? "").contains(query.lowercased())
    }
}

// MARK: - Hashable
extension SessionModel: Hashable {
    
    static func == (lhs: SessionModel, rhs: SessionModel) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
    }
}