import SwiftUI
import Foundation
import Combine
import CombineStorable

// MARK: - ViewModel
final class SessionListViewModel: NSObject, ObservableObject, Storable {
    let input: Input
    let output: Output
    @ObservedObject var binding: Binding
    
    static let models = (
        SessionDay0Type.models 
        + SessionDay1Type.models
        + SessionDay2Type.models
    ).filter { $0.user != nil }
    
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
extension SessionListViewModel {
    
    final class Input {
        let didTapSession: PassthroughSubject<SessionModel, Never>
        let didCloseModal: PassthroughSubject<(), Never>
        let didTapClose: PassthroughSubject<Void, Never>
        
        init(
            didTapSession: PassthroughSubject<SessionModel, Never> = .init(),
            didCloseModal: PassthroughSubject<(), Never> = .init(),
            didTapClose: PassthroughSubject<Void, Never> = .init()
        ) {
            self.didTapSession = didTapSession
            self.didCloseModal = didCloseModal
            self.didTapClose = didTapClose
        }
    }
    
    final class Output: ObservableObject {
        var modalModel: SessionModel?
        let dismissView: PassthroughSubject<Void, Never>
        
        init(
            modalModel: SessionModel? = nil,
            dismissView: PassthroughSubject<Void, Never> = .init()
        ) {
            self.modalModel = modalModel
            self.dismissView = dismissView
        }
    }
    
    final class Binding: ObservableObject {
        @State var searchText = CurrentValueSubject<String, Never>("")
        @Published var isShownModal = false
        @Published var models = SessionListViewModel.models.sorted {
            $0.track.name < $1.track.name 
        }
    }
}

// MARK: - Private
private extension SessionListViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        input
            .didTapSession
            .sink {
                output.modalModel = $0
                binding.isShownModal = true
            }
            .store(in: &cancellables)
        
        input
            .didCloseModal
            .sink { 
                output.modalModel = nil
                binding.isShownModal = false 
            }
            .store(in: &cancellables)
        
        input
            .didTapClose
            .sink { output.dismissView.send($0) }
            .store(in: &cancellables)
        
        binding.searchText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .map { text -> [SessionModel] in
                guard !text.isEmpty else {
                    return SessionListViewModel.models
                }
                return SessionListViewModel.models.filter {
                    $0.contains(query: text)
                }
            }
            .assign(to: \.models, on: binding)
            .store(in: &cancellables)
    }
}
