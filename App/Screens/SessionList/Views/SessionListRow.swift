import SwiftUI

// MARK: - Row
struct SessionListRow: View {
    let model: SessionModel
    let highlightText: String
    let didTap: () -> Void
    
    var body: some View {
        Button(action: didTap) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        SessionRowTrackTag(name: model.track.name)
                        SessionRowSponsorTag(isSponsor: model.isSponsor)
                        SessionRowLtTag(isLT: model.isLT)
                        SessionRowUserTag(user: model.user)
                    }
                    .padding(.bottom, 4)
                    
                    SessionListRowTitleLabel(title: model.title, highlightText: highlightText)
                    SessionListRowBodyLabel(bodyText: model.description!, highlightText: highlightText)
                }
                .padding(.all, 2)
                
                Spacer()
            }
        }
        .padding(.all, 8)
        .background(Color.secondarySystemBackground)
        .cornerRadius(12)
    }
}

// MARK: - Title Label
private struct SessionListRowTitleLabel: View {
    
    let title: String
    let highlightText: String
    
    var attributedText: AttributedString {
        var attributedText = AttributedString(title)
        var lowercasedAttributedText = AttributedString(title.lowercased())
        if let range = lowercasedAttributedText.range(of: highlightText.lowercased()) {
            attributedText[range].foregroundColor = .blue
        }
        return attributedText
    }
    
    var body: some View {
        Text(attributedText)
            .font(.headline)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Body Label
private struct SessionListRowBodyLabel: View {
    
    let bodyText: String
    let highlightText: String
    
    var attributedText: AttributedString? {
        let highlightTextColor: AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute.Value = .blue
        
        var attributedLines: [AttributedString] = []
        bodyText.enumerateLines { line, stop in
            var attributedLine = AttributedString(line)
            var lowercasedAttributedLine = AttributedString(line.lowercased())
            let ranges = lowercasedAttributedLine.ranges(of: highlightText.lowercased())
            for range in ranges {
                attributedLine[range].foregroundColor = highlightTextColor
            }
            attributedLines.append(attributedLine)
        }
        
        let firstAttributedIndex = attributedLines.firstIndex { attributedString in
            attributedString.runs.contains { run in
                run.foregroundColor == highlightTextColor
            }
        }
        /// ハイライトテキストが存在しなければnilを返す
        guard let firstAttributedIndex = firstAttributedIndex else { return nil }
        
        /// 最初にハイライトする文字の前後1行づつを取り出す
        let lowerIndex = max(firstAttributedIndex - 1, attributedLines.startIndex)
        let upperIndex = min(firstAttributedIndex + 1, attributedLines.endIndex)
        let displayLines = attributedLines[lowerIndex..<upperIndex]
        
        var attributedText = AttributedString()
        for attributedLine in displayLines {
            attributedText.append(attributedLine)
        }
        return attributedText
    }
    
    var body: some View {
        if let attributedText = attributedText {
            Text(attributedText)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
    }
}
