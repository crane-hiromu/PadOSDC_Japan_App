import SwiftUI

// MARK: - SessionSheetWrapperView
struct SessionSheetWrapperView: View {
    let model: SessionModel?
    let router: RouterProtocol.Type
    
    var body: some View {
        if let model = model {
            SessionSheetView(model: model, router: router)
        } else {
            // ここを通りえないが画面として例外を用意しておく
            EmptyView(type: .session, size: .init(width: 360, height: 400))
        }
    }
}

// MARK: - SessionSheetView 
private struct SessionSheetView: View {
    let model: SessionModel
    let router: RouterProtocol.Type
    
    var body: some View {
        NavigationView {
            router.routeToSessionDetail(with: model)
                .navigationBarTitle(model.track.name, displayMode: .inline)
        }
        .navigationViewStyle(.stack)
    }
}
