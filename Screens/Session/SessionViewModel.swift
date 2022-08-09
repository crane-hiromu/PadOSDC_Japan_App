import SwiftUI
import Foundation
import Combine
import CombineStorable

final class SessionViewModel: NSObject, ObservableObject, Storable {
    
    let input: Input
    let output: Output
    @ObservedObject var binding: Binding
    
    init(
        input: Input = .init(),
        output: Output,
        binding: Binding = .init()
    ) {
        self.input = input
        self.output = output
        self.binding = binding
        super.init()
        bind(input: input, output: output, binding: binding)
    }
}

extension SessionViewModel {
    
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
        let scheduleType: ScheduleType
        var modalModel: SessionModel?
        
        init(
            scheduleType: ScheduleType,
            modalModel: SessionModel? = nil
        ) {
            self.scheduleType = scheduleType
            self.modalModel = modalModel
        }
    }
    
    final class Binding: ObservableObject {
        @Published var isShownModal = false
    }
}

extension SessionViewModel {
    
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
    }
}
