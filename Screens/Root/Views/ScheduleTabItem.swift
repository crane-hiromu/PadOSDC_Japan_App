import SwiftUI

struct ScheduleTabItem: View {
    
    let scheduleType: ScheduleType
    
    var body: some View {
        Image(systemName: scheduleType.icon)
        Text(scheduleType.day)
    }
}
