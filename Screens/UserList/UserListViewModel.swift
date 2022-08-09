import Foundation
import Combine
import CombineStorable

final class UserListViewModel: NSObject, Storable {
    
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

extension UserListViewModel {
    
    final class Input {
        let didTapSns: PassthroughSubject<SessionUser?, Never>
        
        init(didTapSns: PassthroughSubject<SessionUser?, Never> = .init()) {
            self.didTapSns = didTapSns
        }
    }
    
    final class Output {
        let models: [SessionUser]
        let openSns: PassthroughSubject<URL, Never>
        
        init(
            models: [SessionUser] = SessionUserType.allCases.map(\.user), 
            openSns: PassthroughSubject<URL, Never> = .init()
        ) {
            self.models = models.sorted { $0.name < $1.name }
            self.openSns = openSns
        }
    }
}

extension UserListViewModel {
    
    func bind(input: Input, output: Output) {
        input
            .didTapSns
            .compactMap { $0?.twAccount }
            .compactMap { URL(string: "\(Constants.twitterBaseUrl)/\($0)") }
            .sink { output.openSns.send($0) }
            .store(in: &cancellables)
    }
}
