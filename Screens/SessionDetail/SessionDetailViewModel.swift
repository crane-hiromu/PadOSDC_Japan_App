import Foundation
import Combine
import CombineStorable

final class SessionDetailViewModel: NSObject, Storable {
    
    let input: Input
    let output: Output
    
    init(input: Input, output: Output) {
        self.input = input
        self.output = output
        super.init()
        bind(input: input, output: output)
    }
}

extension SessionDetailViewModel {
    
    final class Input {
        let didTapSns: PassthroughSubject<Void, Never>
        
        init(didTapSns: PassthroughSubject<Void, Never> = .init()) {
            self.didTapSns = didTapSns
        }
    }
    
    final class Output {
        let model: SessionModel
        let openSns: PassthroughSubject<URL, Never>
        
        init(
            model: SessionModel, 
            openSns: PassthroughSubject<URL, Never> = .init()
        ) {
            self.model = model
            self.openSns = openSns
        }
    }
}

extension SessionDetailViewModel {
    
    func bind(input: Input, output: Output) {
        input
            .didTapSns
            .compactMap { output.model.user?.twAccount }
            .compactMap { URL(string: "\(Constants.twitterBaseUrl)/\($0)") }
            .sink { output.openSns.send($0) }
            .store(in: &cancellables)
    }
}
