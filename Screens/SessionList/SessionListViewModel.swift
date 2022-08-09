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
        // nop
    }
    
    final class Output: ObservableObject {
        // nop
    }
    
    final class Binding: ObservableObject {
        @State var searchText = CurrentValueSubject<String, Never>("")
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
        
        binding.searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { $0.lowercased() }
            .map { text -> [SessionModel] in
                guard !text.isEmpty else {
                    return Constants.allSessions
                }
                return Constants.allSessions.filter {
                    $0.title.lowercased().contains(text) 
                    || ($0.description?.lowercased() ?? "").contains(text)
                    || ($0.user?.name.lowercased() ?? "").contains(text)
                    || ($0.user?.twAccount?.lowercased() ?? "").contains(text)
                }
            }
            .assign(to: \.models, on: binding)
            .store(in: &cancellables)
    }
}
