import SwiftUI

// MARK: - View
struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    let environment: RootEnvironment
    
    var body: some View {
        NavigationView {
            TabView { tabViews }
                .toolbar { rootToolbarContent }
                .navigationBarTitle("iOSDC Japan 2022", displayMode: .inline)
        }
        .fullScreenCover(
            isPresented: $viewModel.binding.isShownSessionList,
            onDismiss: { viewModel.input.didCloseSessionList.send(()) },
            content: { environment.router.routeToSessionList() }
        )
        .fullScreenCover(
            isPresented: $viewModel.binding.isShownInfo,
            onDismiss: { viewModel.input.didCloseInfo.send(()) },
            content: { environment.router.routeToInfo() }
        )
        .foregroundColor(.white) // update navigation color
        .navigationViewStyle(.stack)
    }
}

// MARK: - Private
private extension RootView {
    
    var tabViews: some View {
        ForEach(ScheduleType.allCases, id: \.rawValue) {
            environment.router.routeToSession(with: $0)
        }
    }
    
    var rootToolbarContent: some ToolbarContent {
        RootToolbarContent(
            leading: { leadingBarItem }, 
            trailing: { trailingBarItem }
        )
    }
    
    var leadingBarItem: some View {
        Button(action: { 
            viewModel.binding.isShownSessionList = true 
        }) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
        }
    }
    
    var trailingBarItem: some View {
        Button(action: { 
            viewModel.binding.isShownInfo = true 
        }) {
            Image(systemName: "info.circle")
                .foregroundColor(.white)
        }
    }
}
