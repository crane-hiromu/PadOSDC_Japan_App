import SwiftUI
import Foundation
import Combine
import CombineStorable

final class SessionListViewModel: NSObject, ObservableObject, Storable {
    
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

extension SessionListViewModel {
    
    final class Input {
        let didTapSession: PassthroughSubject<SessionModel, Never>
        let didCloseModal: PassthroughSubject<(), Never>
        
        init(
            didTapSession: PassthroughSubject<SessionModel, Never> = .init(),
            didCloseModal: PassthroughSubject<(), Never> = .init()
        ) {
            self.didTapSession = didTapSession
            self.didCloseModal = didCloseModal
        }
    }
    
    final class Output: ObservableObject {
        var modalModel: SessionModel?
        
        init(modalModel: SessionModel? = nil) {
            self.modalModel = modalModel
        }
    }
    
    final class Binding: ObservableObject {
        @State var searchText = CurrentValueSubject<String, Never>("")
        @Published var isShownModal = false
        @Published var models = Constants.allSessions.sorted {
            $0.track.name < $1.track.name 
        }
    }
}

extension SessionListViewModel {
    
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
        
        binding.searchText
            .debounce(for: 0.2, scheduler: DispatchQueue.main)
            .map { text -> [SessionModel] in
                guard !text.isEmpty else {
                    return Constants.allSessions
                }
                return Constants.allSessions.filter {
                    $0.contains(query: text.lowercased())
                }
            }
            .assign(to: \.models, on: binding)
            .store(in: &cancellables)
    }
}
