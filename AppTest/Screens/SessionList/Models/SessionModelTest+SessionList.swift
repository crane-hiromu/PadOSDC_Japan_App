#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
extension SessionModelTest {
    
    /*
     共通化しているので、大小文字のテストは共通関数のみで実施
     */
    func testAttributedText() {
        let model = SessionModel(track: .a, title: "")
        
        // contains text
        do {
            // text: lower, highlightText: lower
            do {
                let result = model.attributedText(with: "test_text", and: "test")
                AssertFalse(result.ranges(of: "test").isEmpty)
                Assert(result.ranges(of: "TEST").isEmpty)
            }
            // text: lower, highlightText: upper
            do {
                let result = model.attributedText(with: "test_text", and: "TEST")
                AssertFalse(result.ranges(of: "test").isEmpty)
                Assert(result.ranges(of: "TEST").isEmpty)
            }
            // text: upper, highlightText: lower
            do {
                let result = model.attributedText(with: "TEST_TEXT", and: "test")
                Assert(result.ranges(of: "test").isEmpty)
                AssertFalse(result.ranges(of: "TEST").isEmpty)
            }
            // text: upper, highlightText: upper
            do {
                let result = model.attributedText(with: "TEST_TEXT", and: "TEST")
                Assert(result.ranges(of: "test").isEmpty)
                AssertFalse(result.ranges(of: "TEST").isEmpty)
            }
        }
        
        // non contains text
        do {
            let result = model.attributedText(with: "test_text", and: "xxxx")
            Assert(result.ranges(of: "xxxx").isEmpty)
        }
    }
    
    func testAttributedTitleText() {
        let model = SessionModel(track: .a, title: "test_title")
        
        // contains text
        let result1 = model.attributedTitleText(with: "test")
        AssertFalse(result1.ranges(of: "test").isEmpty)
        
        // non contains text
        let result2 = model.attributedTitleText(with: "xxxx")
        Assert(result2.ranges(of: "yyyy").isEmpty)
    }
    
    func testAttributedBodyText() {
        // description is nil
        do {
            let model = SessionModel(track: .a, title: "", description: nil)
            let result1 = model.attributedBodyText(with: "test")
            AssertNil(result1)
        }
        
        // description is not nil
        do {
            let model = SessionModel(track: .a, title: "", description: "test_description")
            
            // highlight text
            let result1 = model.attributedBodyText(with: "test")
            let value = try AssertUnwrap(result1)
            AssertFalse(value.ranges(of: "test").isEmpty)
            
            // non highlight text
            let result2 = model.attributedBodyText(with: "xxxx")
            AssertNil(result2)
        } catch {
            assertionFailure("fail to unwrap")
        }
    }
}

#endif
