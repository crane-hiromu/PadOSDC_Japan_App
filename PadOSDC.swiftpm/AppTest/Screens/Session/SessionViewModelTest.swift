#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class SessionViewModelTest: TestCase {
    
    // MARK: Property
    
    private let userDefaults: UserDefaults = .init(suiteName: "test_session") ?? .standard
    
    // MARK: Test
    
    func testDidTapSession() {
        let model = SessionModel(track: .a, title: "")
        let viewModel = SessionViewModel(
            output: .init(scheduleType: .day0), 
            binding: .init(scheduleType: .day0, userDefaults: userDefaults)
        )
        
        AssertNil(viewModel.binding.modalModel)

        viewModel.input.didTapSession.send(model)
        
        AssertEqual(viewModel.binding.modalModel, other: model)
    }
    
    func testDidCloseModal() {
        let model = SessionModel(track: .a, title: "")
        let viewModel = SessionViewModel(
            output: .init(scheduleType: .day0), 
            binding: .init(scheduleType: .day0, userDefaults: userDefaults)
        )
        viewModel.binding.modalModel = model
        
        AssertNotNil(viewModel.binding.modalModel)
        
        viewModel.input.didCloseModal.send(())
        
        AssertNil(viewModel.binding.modalModel)
    }
}

#endif
