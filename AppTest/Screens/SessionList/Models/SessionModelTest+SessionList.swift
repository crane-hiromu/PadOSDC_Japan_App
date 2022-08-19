#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
extension SessionModelTest {
    
    func testAttributedText() {
        let model = SessionModel(track: .a, title: "")
        
        // contains text
        let result1 = model.attributedText(with: "test_text", and: "test")
        AssertFalse(result1.ranges(of: "test").isEmpty)
        
        // non contains text
        let result2 = model.attributedText(with: "test_text", and: "xxxx")
        Assert(result2.ranges(of: "yyyy").isEmpty)
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
            AssertNotNil(result1)
            AssertFalse(result1!.ranges(of: "test").isEmpty)
            
            // non highlight text
            let result2 = model.attributedBodyText(with: "xxxx")
            AssertNil(result2)
        }
    }
}

#endif
