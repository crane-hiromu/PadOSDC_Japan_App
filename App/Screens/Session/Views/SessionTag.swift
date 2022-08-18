import SwiftUI

// MARK: - Tag
struct SessionTag: View {
    let key: LocalizedStringKey?
    let text: String?
    let color: Color
    
    init(
        key: LocalizedStringKey? = nil, 
        text: String? = nil,
        color: Color
    ) {
        self.key = key
        self.text = text
        self.color = color
    }
    
    var body: some View {
        if let key = key {
            SessionTagText(content: { Text(key) }, color: color)
        } else if let text = text {
            SessionTagText(content: { Text(text) }, color: color)
        }
    }
}

private struct SessionTagText<Content: View>: View {
    let content: Content
    let color: Color
    
    init(
        @ViewBuilder content: () -> Content, 
        color: Color
    ) {
        self.content = content()
        self.color = color
    }
    
    var body: some View {
        (content as? Text)?
            .fontWeight(.semibold)
            .font(.caption)
            .foregroundColor(.white)
            .padding(.init(top: 2, leading: 6, bottom: 2, trailing: 6))
            .background(color)
            .cornerRadius(12)
    }
}
