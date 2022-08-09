import SwiftUI

struct RootView: View {
    
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
                ToolbarItem(placement: .navigationBarLeading) {
                    RootLeadingToolbarItem() 
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    RootTrailingToolbarItem() 
                }
            }
            .navigationBarTitle("iOSDC Japan 2020", displayMode: .inline)
        }
        .foregroundColor(.white) // update navigation color
        .navigationViewStyle(.stack)
    }
}

private struct RootLeadingToolbarItem: View {
    
    var body: some View {
        NavigationLink(
            destination: UserListView(viewModel: .init()),
            label: { toolbarItemImage }
        )
    }
    
    private var toolbarItemImage: some View {
        Image(systemName: "person.crop.rectangle.stack")
            .foregroundColor(.white)
    }
}

private struct RootTrailingToolbarItem: View {
    
    var body: some View {
        NavigationLink(
            destination: SessionListView(viewModel: .init()),
            label: { toolbarItemImage }
        )
    }
    
    private var toolbarItemImage: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(.white)
    }
}
