import SwiftUI
import Combine
import CombineStorable

// MARK: - ViewModel
final class InfoViewModel: NSObject, Storable, ObservableObject {
    
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
    
    final class Binding: ObservableObject {
        @AppStorage(.appearanceMode)
        var appearanceMode: AppearanceMode = .default
    }
}

// MARK: - Private
private extension InfoViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
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
