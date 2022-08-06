import SwiftUI

struct SessionView: View {
    
    let scheduleType: ScheduleType
    
    var body: some View {
        ScrollView {
            ForEach(scheduleType.sessions, id: \.id) {
                SessionSection(sessionType: $0)
            }
        }
        .navigationBarTitle("", displayMode: .inline) // remove top space
        .tabItem { 
            ScheduleTabItem(scheduleType: scheduleType) 
        }
    }
}
