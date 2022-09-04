import SwiftUI
import Foundation
import Combine
import CombineStorable

// MARK: - ViewModel
final class MapViewModel: NSObject, ObservableObject, Storable {
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
extension MapViewModel {
    
    final class Input {
        let didDisappear: PassthroughSubject<(), Never>
        let didChangeImageMagnification: PassthroughSubject<CGFloat, Never>
        let didEndImageMagnification: PassthroughSubject<CGFloat, Never>
        let didChangeImageOffset: PassthroughSubject<CGSize, Never>
        let didEndImageOffset: PassthroughSubject<CGSize, Never>
        
        init(
            didDisappear: PassthroughSubject<(), Never> = .init(),
            didChangeImageMagnification: PassthroughSubject<CGFloat, Never> = .init(),
            didEndImageMagnification: PassthroughSubject<CGFloat, Never> = .init(),
            didChangeImageOffset: PassthroughSubject<CGSize, Never> = .init(),
            didEndImageOffset: PassthroughSubject<CGSize, Never> = .init()
        ) {
            self.didDisappear = didDisappear
            self.didChangeImageMagnification = didChangeImageMagnification
            self.didEndImageMagnification = didEndImageMagnification
            self.didChangeImageOffset = didChangeImageOffset
            self.didEndImageOffset = didEndImageOffset
        }
    }
    
    final class Output: ObservableObject {
        // NOP
    }
    
    final class Binding: ObservableObject {
        @Published var offset: CGSize = .zero
        @Published var initialOffset: CGSize = .zero
        @Published var scale: CGFloat = 1.0
        @Published var initialScale: CGFloat = 1.0
        
        init(
            offset: CGSize = .zero,
            initialOffset: CGSize = .zero,
            scale: CGFloat = 1.0,
            initialScale: CGFloat = 1.0
        ) {
            self.offset = offset
            self.initialOffset = initialOffset
            self.scale = scale
            self.initialScale = initialScale
        }
    }
}

// MARK: - Private
private extension MapViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        input
            .didDisappear
            .sink {
                // reset image position
                binding.offset = .zero
                binding.initialOffset = .zero
                binding.scale = 1.0
                binding.initialScale = 1.0
            }
            .store(in: &cancellables)
        
        input
            .didChangeImageMagnification
            .map { $0 * binding.initialScale }
            .assign(to: \.scale, on: binding)
            .store(in: &cancellables)
        
        input
            .didEndImageMagnification
            .map { _ in binding.scale }
            .assign(to: \.initialScale, on: binding)
            .store(in: &cancellables)
        
        input
            .didChangeImageOffset
            .map {
                CGSize(
                    width: binding.initialOffset.width + $0.width / binding.scale,
                    height: binding.initialOffset.height + $0.height / binding.scale
                )
            }
            .assign(to: \.offset, on: binding)
            .store(in: &cancellables)
        
        input
            .didEndImageOffset
            .map { _ in binding.offset }
            .assign(to: \.initialOffset, on: binding)
            .store(in: &cancellables)
    }
}
