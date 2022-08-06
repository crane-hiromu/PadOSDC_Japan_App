import SwiftUI

struct RootView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(ScheduleType.allCases, id: \.rawValue) {
                    SessionView(scheduleType: $0)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
