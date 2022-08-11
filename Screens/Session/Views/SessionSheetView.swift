import SwiftUI

struct SessionSheetView: View {
    
    let model: SessionModel?
    
    var body: some View {
        if let model = model {
            SessionModalView(model: model)
        } else {
            // ここを通りえないが画面として例外を用意しておく
            SessionEmptyView(size: .init(width: 360, height: 400))
        }
    }
}
