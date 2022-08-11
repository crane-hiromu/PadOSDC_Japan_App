import SwiftUI

enum ScheduleType: Int, CaseIterable {
    case day0, day1, day2
    
    var icon: String {
        switch self {
        case .day0: return "square.3.stack.3d.top.fill"
        case .day1: return "square.3.stack.3d.middle.fill"
        case .day2: return "square.3.stack.3d.bottom.fill"
        }
    }
    
    var day: String {
        switch self {
        case .day0: return "9/10"
        case .day1: return "9/11"
        case .day2: return "9/12"
        }
    }
    
    var sessions: [SessionType] {
        switch self {
        case .day0: return SessionDay0Type.allCases
        case .day1: return SessionDay1Type.allCases
        case .day2: return SessionDay2Type.allCases
        }
    }
}
