import Foundation
import SwiftUI
import Combine
import CombineStorable

// MARK: - ViewModel
final class SessionDetailViewModel: NSObject, Storable {
    let input: Input
    let output: Output
    
    init(
        input: Input = .init(),
        output: Output
    ) {
        self.input = input
        self.output = output
        super.init()
        bind(input: input, output: output)
    }
}

// MARK: - Property
extension SessionDetailViewModel {
    
    final class Input {
        let didTapSns: PassthroughSubject<Void, Never>
        let didTapYoutube: PassthroughSubject<Void, Never>
        let didTapClose: PassthroughSubject<Void, Never>
        
        init(
            didTapSns: PassthroughSubject<Void, Never> = .init(),
            didTapYoutube: PassthroughSubject<Void, Never> = .init(),
            didTapClose: PassthroughSubject<Void, Never> = .init()
        ) {
            self.didTapSns = didTapSns
            self.didTapYoutube = didTapYoutube
            self.didTapClose = didTapClose
        }
    }
    
    final class Output {
        let model: SessionModel
        let openSns: PassthroughSubject<URL, Never>
        let dismissView: PassthroughSubject<Void, Never>
        
        init(
            model: SessionModel,
            openSns: PassthroughSubject<URL, Never> = .init(),
            dismissView: PassthroughSubject<Void, Never> = .init()
        ) {
            self.model = model
            self.openSns = openSns
            self.dismissView = dismissView
        }
    }
}

// MARK: - Private
private extension SessionDetailViewModel {
    
    func bind(input: Input, output: Output) {
        input
            .didTapSns
            .compactMap { output.model.user?.twAccount }
            .compactMap { URL(string: "\(Constants.twitterBaseUrl)/\($0)") }
            .sink { output.openSns.send($0) }
            .store(in: &cancellables)
        
        input
            .didTapYoutube
            .compactMap { output.model.archiveParameter }
            .compactMap { URL(string: "\(Constants.youtubeBaseUrl)\($0)") }
            .sink { output.openSns.send($0) }
            .store(in: &cancellables)
        
        input
            .didTapClose
            .sink { output.dismissView.send($0) }
            .store(in: &cancellables)
    }
}
