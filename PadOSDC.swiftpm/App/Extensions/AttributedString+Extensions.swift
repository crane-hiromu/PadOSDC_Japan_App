import Foundation

extension AttributedString {
    func ranges<T: StringProtocol>(of stringToFind: T) -> [Range<AttributedString.Index>] {
        var ranges: [Range<AttributedString.Index>] = []
        var substring = self[self.startIndex ..< self.endIndex]
        while let range = substring.range(of: stringToFind) {
            ranges.append(range)
            substring = self[range.upperBound...]
        }
        return ranges
    }
}
