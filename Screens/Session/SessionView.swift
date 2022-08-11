import SwiftUI
import UIKit

struct SessionView: View {
    
    @ObservedObject var viewModel: SessionViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.output.scheduleType.sessions, id: \.id) { type in
                SessionSection(
                    sessionType: type, 
                    didTapRow: { viewModel.input.didTapSession.send($0) }
                )
            }
        }
        .tabItem { 
            ScheduleTabItem(scheduleType: viewModel.output.scheduleType) 
        }
        .sheet(
            item: $viewModel.binding.modalModel,
            onDismiss: { viewModel.input.didCloseModal.send(()) },
            content: { SessionSheetView(model: $0) }
        )
        .background(.black)
    }
}

private struct ScheduleTabItem: View {
    
    let scheduleType: ScheduleType
    
    var body: some View {
        Image(systemName: scheduleType.icon)
        Text(scheduleType.day)
    }
}

