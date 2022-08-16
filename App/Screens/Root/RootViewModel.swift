import SwiftUI
import Foundation
import Combine
import CombineStorable

// MARK: - ViewModel
final class RootViewModel: NSObject, ObservableObject, Storable {
    
    let input: Input
    let output: Output
    @ObservedObject var binding: Binding
    
    init(
        input: Input = .init(),
        output: Output = .init(),
        binding: Binding = .init()
    ) {
        self.input = input
        self.output = output
        self.binding = binding
        super.init()
        bind(input: input, output: output, binding: binding)
    }
}

// MARK: - Property
extension RootViewModel {
    
    final class Input {
        let didCloseSessionList: PassthroughSubject<(), Never>
        let didCloseInfo: PassthroughSubject<(), Never>
        
        init(
            didCloseSessionList: PassthroughSubject<(), Never> = .init(),
            didCloseInfo: PassthroughSubject<(), Never> = .init()
        ) {
            self.didCloseSessionList = didCloseSessionList
            self.didCloseInfo = didCloseInfo
        }
    }
    
    final class Output: ObservableObject {
        // nop
    }
    
    final class Binding: ObservableObject {
        @Published var isShownSessionList: Bool = false
        @Published var isShownInfo: Bool = false
        @AppStorage(.appearanceMode)
        var appearanceMode: AppearanceMode = .default
    }
}

// MARK: - Private
private extension RootViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding
            .objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        input
            .didCloseSessionList
            .sink { binding.isShownSessionList = false }
            .store(in: &cancellables)
        
        input
            .didCloseInfo
            .sink { binding.isShownInfo = false }
            .store(in: &cancellables)
    }
}
