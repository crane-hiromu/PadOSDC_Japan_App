#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation

// MARK: - Test
@objcMembers
final class UserListViewModelTest: TestCase {
    
    func testDidTapSns() {
        var cancellables: Set<AnyCancellable> = []
        let expectation = Expectation(name: "Wait for didTapSns")
        let user = StaffUser(icon: nil, name: "", twAccount: "hcrane14")
        let viewModel = UserListViewModel(output: .init(models: [user]))
        
        viewModel.output.openSns
            .sink { url in
                AssertEqual(url.absoluteString, other: "https://twitter.com/hcrane14")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didTapSns.send(user)
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testTitle() {
        // user is StaffUser
        do {
            let user = StaffUser(name: "")
            let viewModel = UserListViewModel(output: .init(models: [user]))
            
            if Locale.current.languageCode == "ja" {
                AssertEqual(viewModel.output.localizedKey, other: "スタッフ")
            } else {
                AssertEqual(viewModel.output.localizedKey, other: "Staff")
            }
        }
        
        // user is SessionUser
        do {
            let user = SessionUser(name: "")
            let viewModel = UserListViewModel(output: .init(models: [user]))
            
            if Locale.current.languageCode == "ja" {
                AssertEqual(viewModel.output.localizedKey, other: "スピーカー")
            } else {
                AssertEqual(viewModel.output.localizedKey, other: "Speaker")
            }
        }
    }
}

#endif
