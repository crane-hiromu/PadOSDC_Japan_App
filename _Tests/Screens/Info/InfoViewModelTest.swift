#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class InfoViewModelTest: TestCase {
    
    func testDidTapButton() {
        var cancellables: Set<AnyCancellable> = []
        
        // type: .about
        do {
            let expectation = Expectation(name: "Wait for didTapButton, type: .about")
            let viewModel = InfoViewModel()
            
            viewModel.output.openSns
                .sink { url in
                    AssertEqual(url.absoluteString, other: "https://iosdc.jp/2022/")
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.input.didTapButton.send(.about)
            
            AssertExpectations([expectation], timeout: 1)
        }
        // type: .staff
        do {
            let expectation = Expectation(name: "Wait for didTapButton, type: .staff")
            let viewModel = InfoViewModel()
            
            viewModel.output.openSns
                .sink { _ in
                    assertionFailure("never exec")
                }
                .store(in: &cancellables)
            
            viewModel.input.didTapButton.send(.staff)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                expectation.fulfill()
            }
            AssertExpectations([expectation], timeout: 1)
        }
        // type: .speaker
        do {
            let expectation = Expectation(name: "Wait for didTapButton, type: .speaker")
            let viewModel = InfoViewModel()
            
            viewModel.output.openSns
                .sink { _ in
                    assertionFailure("never exec")
                }
                .store(in: &cancellables)
            
            viewModel.input.didTapButton.send(.speaker)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                expectation.fulfill()
            }
            AssertExpectations([expectation], timeout: 1)
        }
        // type: .blog
        do {
            let expectation = Expectation(name: "Wait for didTapButton, type: .blog")
            let viewModel = InfoViewModel()
            
            viewModel.output.openSns
                .sink { url in
                    AssertEqual(url.absoluteString, other: "https://blog.iosdc.jp/")
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.input.didTapButton.send(.blog)
            
            AssertExpectations([expectation], timeout: 1)
        }
        // type: .privacyPolicy
        do {
            let expectation = Expectation(name: "Wait for didTapButton, type: .privacyPolicy")
            let viewModel = InfoViewModel()
            
            viewModel.output
                .openSns
                .sink { url in
                    AssertEqual(url.absoluteString, other: "https://crane-hiromu.github.io/PadOSDC-iOS-App-Privacy-Policy.io/")
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.input.didTapButton.send(.privacyPolicy)
            
            AssertExpectations([expectation], timeout: 1)
        }
    }
    
    func testDidTapClose() {
        let expectation = Expectation(name: "Wait for didTapClose")
        let viewModel = InfoViewModel()
        
        viewModel.output
            .dismissView
            .sink { 
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapClose.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
}

#endif
