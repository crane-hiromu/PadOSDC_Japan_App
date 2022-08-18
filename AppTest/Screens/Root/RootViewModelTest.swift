#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class RootViewModelTest: TestCase {
    
    // MARK: Property
    
    private let userDefaults: UserDefaults = .init(suiteName: "test_root") ?? .standard
    
    // MARK: Test
    
    func testDidCloseSessionList() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didCloseSessionList")
        let viewModel = RootViewModel(binding: .init(userDefaults: userDefaults))
        
        viewModel.binding.isShownSessionList = true
        Assert(viewModel.binding.isShownSessionList)
        
        viewModel.binding.$isShownSessionList
            .dropFirst()
            .sink { flag in
                AssertFalse(flag)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didCloseSessionList.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testDidCloseInfo() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didCloseSessionList")
        let viewModel = RootViewModel(binding: .init(userDefaults: userDefaults))
        
        viewModel.binding.isShownInfo = true
        Assert(viewModel.binding.isShownInfo)
        
        viewModel.binding.$isShownInfo
            .dropFirst()
            .sink { flag in
                AssertFalse(flag)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didCloseInfo.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
}

#endif
