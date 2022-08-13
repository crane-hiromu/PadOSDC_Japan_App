import SwiftUI
import Combine
import CombineStorable

// MARK: - ViewModel
final class InfoViewModel: NSObject, Storable {
    
    let input: Input
    let output: Output
    
    init(
        input: Input = .init(),
        output: Output = .init()
    ) {
        self.input = input
        self.output = output
        super.init()
        bind(input: input, output: output)
    }
}

// MARK: - Property
extension InfoViewModel {
    
    final class Input {
        let didTapButton: PassthroughSubject<InfoType, Never>
        let didTapClose: PassthroughSubject<Void, Never>
        
        init(
            didTapButton: PassthroughSubject<InfoType, Never> = .init(),
            didTapClose: PassthroughSubject<Void, Never> = .init()
        ) {
            self.didTapButton = didTapButton
            self.didTapClose = didTapClose
        }
    }
    
    final class Output {
        let openSns: PassthroughSubject<URL, Never>
        let dismissView: PassthroughSubject<Void, Never>
        
        init(
            openSns: PassthroughSubject<URL, Never> = .init(),
            dismissView: PassthroughSubject<Void, Never> = .init()
        ) {
            self.openSns = openSns
            self.dismissView = dismissView
        }
    }
}

// MARK: - Private
private extension InfoViewModel {
    
    func bind(input: Input, output: Output) {
        input
            .didTapButton
            .compactMap { $0.url }
            .compactMap { URL(string: "\($0)") }
            .sink { output.openSns.send($0) }
            .store(in: &cancellables)
        
        input
            .didTapClose
            .sink { output.dismissView.send($0) }
            .store(in: &cancellables)
    }
}
