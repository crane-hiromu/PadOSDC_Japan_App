#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class SessionDetailViewModelTest: TestCase {

    func testDidTapSns() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didTapSns")
        let user = SessionUser(icon: nil, name: "", twAccount: "hcrane14")
        let model = SessionModel(track: .a, title: "", user: user)
        let viewModel = SessionDetailViewModel(output: .init(model: model))
        
        viewModel.output.openSns
            .sink { url in
                AssertEqual(url.absoluteString, other: "https://twitter.com/hcrane14")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapSns.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testDidTapYoutube() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didTapYoutube")
        let user = SessionUser(icon: nil, name: "", twAccount: "hcrane14")
        let model = SessionModel(track: .a, title: "", user: user, archiveParameter: "6nWnQVRVcs0")
        let viewModel = SessionDetailViewModel(output: .init(model: model))
        
        viewModel.output.openSns
            .sink { url in
                AssertEqual(url.absoluteString, other: "https://www.youtube.com/watch?v=6nWnQVRVcs0")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapYoutube.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testDidTapClose() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didTapSns")
        let user = SessionUser(icon: nil, name: "", twAccount: "hcrane14")
        let model = SessionModel(track: .a, title: "", user: user)
        let viewModel = SessionDetailViewModel(output: .init(model: model))
        
        viewModel.output.dismissView
            .sink {
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapClose.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
}

#endif
