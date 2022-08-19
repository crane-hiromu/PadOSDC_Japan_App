import Foundation

// MARK: - Model
struct SessionModel: Identifiable {
    let id: UUID
    let track: TrackType
    let title: String
    let description: String?
    let user: SessionUser?
    let isSponsor: Bool
    let isLT: Bool
    
    init(
        id: UUID = .init(),
        track: TrackType,
        title: String,
        description: String? = nil, 
        user: SessionUser? = nil,
        isSponsor: Bool = false,
        isLT: Bool = false
    ) {
        self.id = id
        self.track = track
        self.title = title
        self.description = description
        self.user = user
        self.isSponsor = isSponsor
        self.isLT = isLT
    }
}

// MARK: - Internal
extension SessionModel {
    
    func contains(query: String) -> Bool {
        title.lowercased().contains(query.lowercased())
        || (description?.lowercased() ?? "").contains(query.lowercased())
        || (user?.name.lowercased() ?? "").contains(query.lowercased())
        || (user?.twAccount?.lowercased() ?? "").contains(query.lowercased())
    }
}

// MARK: - SessionListRowTitleLabel & SessionListRowBodyLabel
extension SessionModel {
    
    private var highlightTextColor: AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute.Value {
        .blue
    }
    
    func attributedText(with text: String,  and highlightText: String) -> AttributedString {
        var attributedText = AttributedString(text)
        let lowercasedAttributedText = AttributedString(text.lowercased())
        if let range = lowercasedAttributedText.range(of: highlightText.lowercased()) {
            attributedText[range].foregroundColor = highlightTextColor
        }
        return attributedText
    }
    
    func attributedTitleText(with highlightText: String) -> AttributedString {
        attributedText(with: title, and: highlightText)
    }
    
    func attributedBodyText(with highlightText: String) -> AttributedString? {
        guard let bodyText = description else { return nil }

        var attributedLines: [AttributedString] = []
        bodyText.enumerateLines { line, _ in
            let text = attributedText(with: line, and: highlightText)
            attributedLines.append(text)
        }
        
        let firstAttributedIndex = attributedLines.firstIndex { attributedString in
            attributedString.runs.contains { $0.foregroundColor == highlightTextColor }
        }
        /// ハイライトテキストが存在しなければnilを返す
        guard let firstAttributedIndex = firstAttributedIndex else { return nil }
        
        /// 最初にハイライトする文字の前後1行づつを取り出す
        let lowerIndex = max(firstAttributedIndex - 1, attributedLines.startIndex)
        let upperIndex = min(firstAttributedIndex + 1, attributedLines.endIndex)
        let displayLines = attributedLines[lowerIndex..<upperIndex]
        
        var attributedString = AttributedString()
        for attributedLine in displayLines {
            attributedString.append(attributedLine)
        }
        return attributedString
    }
}

// MARK: - Hashable
extension SessionModel: Hashable {
    
    static func == (lhs: SessionModel, rhs: SessionModel) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
    }
}
