#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
@objcMembers
final class TrackTypeTest: TestCase {
    
    func testName() {
        AssertEqual(TrackType.a.name, other: "Track A")
        AssertEqual(TrackType.b.name, other: "Track B")
        AssertEqual(TrackType.c.name, other: "Track C")
        AssertEqual(TrackType.d.name, other: "Track D")
        AssertEqual(TrackType.e.name, other: "Track E")
    }
}

#endif
