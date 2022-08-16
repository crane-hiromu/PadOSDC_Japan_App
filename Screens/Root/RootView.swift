import SwiftUI
import SwiftUIWorkaround

// MARK: - View
struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    let environment: RootEnvironment
    
    var body: some View {
        TabView { tabViews }
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
            .navigationViewStyle(.stack)
            .workaround.preferredAppearanceMode(viewModel.binding.$appearanceMode)
    }
}

// MARK: - Private
private extension RootView {
    
    var tabViews: some View {
        ForEach(ScheduleType.allCases, id: \.rawValue) { scheduleType in
            NavigationView {
                environment.router.routeToSession(with: scheduleType)
                    .toolbar { rootToolbarContent }
                    .navigationBarTitle("iOSDC Japan 2022", displayMode: .inline)
            }
            .tabItem { scheduleTabItem(scheduleType) }
        }
    }
    
    func scheduleTabItem(_ scheduleType: ScheduleType) -> some View {
        VStack(spacing: 0) {
            Image(systemName: scheduleType.icon)
            Text(scheduleType.day)
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
        }
    }
    
    var trailingBarItem: some View {
        Button(action: { 
            viewModel.binding.isShownInfo = true 
        }) {
            Image(systemName: "info.circle")
        }
    }
}
