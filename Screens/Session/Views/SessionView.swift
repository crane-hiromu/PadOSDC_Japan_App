import SwiftUI
import UIKit

struct SessionView: View {
    
    let scheduleType: ScheduleType
    
    var body: some View {
        ScrollView {
            ForEach(scheduleType.sessions, id: \.id) {
                SessionSection(sessionType: $0)
            }
        }
        .navigationBarTitle("iOSDC Japan 2020", displayMode: .inline) // remove top space
        .background(.black)
        .tabItem { 
            ScheduleTabItem(scheduleType: scheduleType) 
        }
    }
}
