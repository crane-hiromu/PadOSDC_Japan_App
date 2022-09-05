#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class SessionListViewModelTest: TestCase {
    
    func testDidTapSession() {
        let viewModel = SessionListViewModel()
        let model = SessionModel(track: .a, title: "")
        
        AssertNil(viewModel.output.modalModel)
        AssertFalse(viewModel.binding.isShownModal)
        
        viewModel.input.didTapSession.send(model)
        
        AssertEqual(viewModel.output.modalModel, other: model)
        Assert(viewModel.binding.isShownModal)
    }
    
    func testDidCloseModal() {
        let viewModel = SessionListViewModel()
        let model = SessionModel(track: .a, title: "")
        viewModel.output.modalModel = model
        viewModel.binding.isShownModal = true
        
        AssertNotNil(viewModel.output.modalModel)
        Assert(viewModel.binding.isShownModal)
        
        viewModel.input.didCloseModal.send(())
        
        AssertNil(viewModel.output.modalModel)
        AssertFalse(viewModel.binding.isShownModal)
    }
    
    func testDidTapClose() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didTapClose")
        let viewModel = SessionListViewModel()
        
        viewModel.output.dismissView
            .sink {
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapClose.send(())
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testSearchText() {
        var cancellables: Set<AnyCancellable> = []
        
        // text is empty
        do {
            let expectation = Expectation(name: "Wait for SearchText, text is empty")
            let viewModel = SessionListViewModel()
            
            viewModel.binding.$models
                .dropFirst()
                .sink { models in
                    AssertEqual(models.count, other: SessionListViewModel.models.count)
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.binding.searchText.send("")
            
            AssertExpectations([expectation], timeout: 1)
        }

        // text is not empty
        do {
            let expectation = Expectation(name: "Wait for SearchText, text is not empty")
            let viewModel = SessionListViewModel()
            
            viewModel.binding.$models
                .dropFirst()
                .sink { models in
                    AssertEqual(models.count, other: 12)
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            
            viewModel.binding.searchText.send("swiftui")
            
            AssertExpectations([expectation], timeout: 1)
        }
    }
}

#endif
