import SwiftUI

struct RootView: View {
    
    @ObservedObject var viewModel: RootViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(ScheduleType.allCases, id: \.rawValue) {
                    SessionView(viewModel: .init(
                        output: .init(scheduleType: $0)
                    ))
                }
            }
            .toolbar {
                RootToolbarContent(
                    didTapSessionList: { viewModel.binding.isShownSessionList = true },
                    didTapInfo: { viewModel.binding.isShownInfo = true }
                )
            }
            .navigationBarTitle("iOSDC Japan 2020", displayMode: .inline)
        }
        .fullScreenCover(
            isPresented: $viewModel.binding.isShownSessionList,
            onDismiss: { viewModel.input.didCloseSessionList.send(()) },
            content: { SessionListView(viewModel: .init()) }
        )
        .fullScreenCover(
            isPresented: $viewModel.binding.isShownInfo,
            onDismiss: { viewModel.input.didCloseInfo.send(()) },
            content: { InfoView(viewModel: .init()) }
        )
        .foregroundColor(.white) // update navigation color
        .navigationViewStyle(.stack)
    }
}

private struct RootToolbarContent: ToolbarContent {
    
    let didTapSessionList: () -> Void
    let didTapInfo: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            RootSessionListToolbarItem(didTapItem: didTapSessionList)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            RootInfoToolbarItem(didTapItem: didTapInfo)
        }
    }
}

private struct RootSessionListToolbarItem: View {
    
    let didTapItem: () -> Void
    
    var body: some View {
        Button(action: didTapItem) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
        }
    }
}

private struct RootInfoToolbarItem: View {
    
    let didTapItem: () -> Void
    
    var body: some View {
        Button(action: didTapItem) {
            Image(systemName: "info.circle")
                .foregroundColor(.white)
        }
    }
}
