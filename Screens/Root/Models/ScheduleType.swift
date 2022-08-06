import SwiftUI

enum ScheduleType: Int, CaseIterable {
    case day1, day2, day3
    
    var icon: String {
        switch self {
        case .day1: return "leaf"
        case .day2: return "ladybug"
        case .day3: return "tortoise"
        }
    }
    
    var day: String {
        switch self {
        case .day1: return "9/10"
        case .day2: return "9/11"
        case .day3: return "9/12"
        }
    }
    
    var sessions: [SessionType] {
        switch self {
        case .day1: return SessionDay1Type.allCases
        case .day2: return SessionDay2Type.allCases
        case .day3: return SessionDay3Type.allCases
        }
    }
}
