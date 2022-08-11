import SwiftUI

struct SessionEmptyView: View {
    
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: "exclamationmark.octagon")
                .resizable()
                .frame(width: 60, height: 60)
            Text("該当するセッションが見つかりませんでした。")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: size.width, height: size.height)
    }
}
