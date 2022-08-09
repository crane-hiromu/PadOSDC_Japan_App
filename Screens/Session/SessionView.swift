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
        .sheet(
            isPresented: $viewModel.binding.isShownModal,
            onDismiss: { viewModel.input.didCloseModal.send(()) },
            content: { SessionSheetView(model: viewModel.output.modalModel) }
        )
        .tabItem { 
            ScheduleTabItem(scheduleType: viewModel.output.scheduleType) 
        }
        .background(.black)
    }
}

private struct SessionSheetView: View {
    
    let model: SessionModel?
    
    var body: some View {
        if let model = model {
            SessionModalView(model: model)
        } else {
            EmptyView() // todo error
        }
    }
}

private struct ScheduleTabItem: View {
    
    let scheduleType: ScheduleType
    
    var body: some View {
        Image(systemName: scheduleType.icon)
        Text(scheduleType.day)
    }
}

