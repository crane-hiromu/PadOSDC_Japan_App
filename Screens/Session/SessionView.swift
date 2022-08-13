import SwiftUI
import UIKit

// MARK: - View
struct SessionView: View {
    @ObservedObject var viewModel: SessionViewModel
    let environment: SessionEnvironment
    
    var body: some View {
        ScrollView { sessionList }
            .tabItem { scheduleTabItem }
            .sheet(
                item: $viewModel.binding.modalModel,
                onDismiss: { viewModel.input.didCloseModal.send(()) },
                content: { SessionSheetWrapperView(model: $0, router: environment.router) }
            )
            .background(.black)
    }
}

// MARK: - Private
private extension SessionView {
    
    var sessionList: some View {
        ForEach(viewModel.output.scheduleType.sessions, id: \.id) { type in
            SessionSection(
                isExpanded: $viewModel.binding.expandFlags[type.index],
                sessionType: type, 
                didTapRow: { viewModel.input.didTapSession.send($0) }
            )
        }
    }
    
    var scheduleTabItem: some View {
        VStack(spacing: 0) {
            Image(systemName: viewModel.output.scheduleType.icon)
            Text(viewModel.output.scheduleType.day)
        }
    }
}
