#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
@objcMembers
final class TrackTypeTest: TestCase {
    
    func testName() {
        // A
        switch Constants.LanguageType.current {
        case .en: AssertEqual(TrackType.a.name, other: "Track A")
        case .ja: AssertEqual(TrackType.a.name, other: "トラック A")
        case .none: assertionFailure("non supported")
        }
        
        // B
        switch Constants.LanguageType.current {
        case .en: AssertEqual(TrackType.b.name, other: "Track B")
        case .ja: AssertEqual(TrackType.b.name, other: "トラック B")
        case .none: assertionFailure("non supported")
        }
        
        // C
        switch Constants.LanguageType.current {
        case .en: AssertEqual(TrackType.c.name, other: "Track C")
        case .ja: AssertEqual(TrackType.c.name, other: "トラック C")
        case .none: assertionFailure("non supported")
        }
        
        // D
        switch Constants.LanguageType.current {
        case .en: AssertEqual(TrackType.d.name, other: "Track D")
        case .ja: AssertEqual(TrackType.d.name, other: "トラック D")
        case .none: assertionFailure("non supported")
        }
        
        
        // E
        switch Constants.LanguageType.current {
        case .en: AssertEqual(TrackType.e.name, other: "Track E")
        case .ja: AssertEqual(TrackType.e.name, other: "トラック E")
        case .none: assertionFailure("non supported")
        }
    }
}

#endif
