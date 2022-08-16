import SwiftUI

// MARK: - Tag
struct SessionTag: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)                        
            .fontWeight(.semibold)
            .font(.caption)
            .foregroundColor(.white)
            .padding(.init(top: 2, leading: 6, bottom: 2, trailing: 6))
            .background(color)
            .cornerRadius(12)
    }
}
