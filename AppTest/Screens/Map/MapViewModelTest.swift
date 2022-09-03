#if TESTING_ENABLED

/*
 Combineのテストが対応していないので、Expectationで代用する。
 */

import PlaygroundTester
import Combine
import Foundation
import UIKit

// MARK: - Test
@objcMembers
final class MapViewModelTest: TestCase {
    
    func testDidDisappear() {
        let viewModel = MapViewModel(binding: .init(
            offset: .init(width: 999, height: 999),
            initialOffset: .init(width: 999, height: 999),
            scale: 999, 
            initialScale: 999
        ))
        
        viewModel.input.didDisappear.send(())
        
        AssertEqual(viewModel.binding.offset, other: .zero)
        AssertEqual(viewModel.binding.initialOffset, other: .zero)
        AssertEqual(viewModel.binding.scale, other: 1.0)
        AssertEqual(viewModel.binding.initialScale, other: 1.0)
    }
    
    func testDidChangeImageMagnification() {
        var cancellables: Set<AnyCancellable> = []
        
        let expectation = Expectation(name: "Wait for didChangeImageMagnification")
        let viewModel = MapViewModel(binding: .init(initialScale: 2.0))
        
        viewModel.binding.$scale
            .dropFirst(1) // ignore initial value
            .sink { value in
                AssertEqual(value, other: 200)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didChangeImageMagnification.send(100)
        
        AssertExpectations([expectation], timeout: 1)
    }

    func testDidEndImageMagnification() {
        var cancellables: Set<AnyCancellable> = []
        
        let expectation = Expectation(name: "Wait for didEndImageMagnification")
        let viewModel = MapViewModel(binding: .init(scale: 10.0))
        
        viewModel.binding.$initialScale
            .dropFirst(1) // ignore initial value
            .sink { value in
                AssertEqual(value, other: 10)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didEndImageMagnification.send(100)
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testDidChangeImageOffset() {
        var cancellables: Set<AnyCancellable> = []
        
        let expectation = Expectation(name: "Wait for didChangeImageOffset")
        let viewModel = MapViewModel(binding: .init(
            initialOffset: .init(width: 100, height: 100)
        ))
        
        viewModel.binding.$offset
            .dropFirst(1) // ignore initial value
            .sink { size in
                AssertEqual(size.width, other: 200)
                AssertEqual(size.height, other: 200)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didChangeImageOffset.send(.init(width: 100, height: 100))
        
        AssertExpectations([expectation], timeout: 1)
    }
    
    func testDidEndImageOffset() {
        var cancellables: Set<AnyCancellable> = []
        
        let expectation = Expectation(name: "Wait for didEndImageOffset")
        let viewModel = MapViewModel(binding: .init(
            offset: .init(width: 100, height: 100)
        ))
        
        viewModel.binding.$initialOffset
            .dropFirst(1) // ignore initial value
            .sink { size in
                AssertEqual(size.width, other: 100)
                AssertEqual(size.height, other: 100)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.input.didEndImageOffset.send(.init(width: 500, height: 500))
        
        AssertExpectations([expectation], timeout: 1)
    }
}

#endif
