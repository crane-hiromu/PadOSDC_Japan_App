#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
@objcMembers
final class SessionModelTest: TestCase {

    func testContains() {
        // title
        do {
            // lower
            do { 
                let model = SessionModel(track: .a, title: "test title")
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
            // upper
            do { 
                let model = SessionModel(track: .a, title: "TEST TITLE")
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
        }

        // description
        do {
            // lower
            do { 
                let model = SessionModel(track: .a, title: "", description: "test description")
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
            // upper
            do { 
                let model = SessionModel(track: .a, title: "", description: "TEST DESCRIPTION")
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
        }
        
        // name
        do {
            // lower
            do { 
                let model = SessionModel(track: .a, title: "", user: .init(name: "test name"))
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
            // upper
            do { 
                let model = SessionModel(track: .a, title: "", user: .init(name: "TEST NAME"))
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
        }
        
        // description
        do {
            // lower
            do {
                let user = SessionUser(icon: nil, name: "", twAccount: "test twAccount")
                let model = SessionModel(track: .a, title: "", user: user)
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
            // upper
            do { let user = SessionUser(icon: nil, name: "", twAccount: "TEST TWACCOUNT")
                let model = SessionModel(track: .a, title: "", user: user)
                Assert(model.contains(query: "test"))
                Assert(model.contains(query: "TEST"))
                Assert(model.contains(query: "TEst"))
                AssertFalse(model.contains(query: "xxxx"))
            }
        }
    }
}

#endif
