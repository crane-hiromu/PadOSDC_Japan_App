import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentation
    let viewModel: InfoViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                InfoListView(
                    didTapButton: { viewModel.input.didTapButton.send($0) }
                )
            }
            .toolbar {
                CloseToolbarContent { presentation.wrappedValue.dismiss() }
            }
            .frame(maxWidth: .infinity)
            .background(.black)
            .navigationBarTitle("Infomation", displayMode: .inline)
        }
        .onReceive(viewModel.output.openSns) {
            UIApplication.shared.open($0)
        }
        .accentColor(.gray)
    }
}

private struct InfoListView: View {
    
    let didTapButton: (InfoType) -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            InfoButtonRow(
                type: .about,
                action: { didTapButton(.about) }
            )
            InfoNavigationRow(
                type: .staff,
                destination: staffListView
            )
            InfoNavigationRow(
                type: .speaker,
                destination: speakerListView
            )
            InfoButtonRow(
                type: .blog,
                action: { didTapButton(.blog) }
            )
            Spacer()
        }
        .padding()
    }
    
    private var staffListView: some View {
        UserListView(viewModel: .init(
            output: .init(models: StaffUserType.allCases.map(\.user))
        ))
    }
    
    private var speakerListView: some View {
        UserListView(viewModel: .init(
            output: .init(models: SessionUserType.allCases.map(\.user).sorted { 
                $0.name < $1.name 
            })
        ))
    }
}

private struct InfoButtonRow: View {
    
    let type: InfoType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            InfoRowContent(type: type)
        }
    }
}

private struct InfoNavigationRow<Destination: View>: View {
    
    let type: InfoType
    let destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: { InfoRowContent(type: type) }
        )
    }
}
