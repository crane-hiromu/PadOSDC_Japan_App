import SwiftUI
import Foundation
import Combine
import CombineStorable

// MARK: - ViewModel
final class LicenseViewModel: NSObject, ObservableObject, Storable {
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
extension LicenseViewModel {
    
    final class Input {
        // NOP
    }
    
    final class Output: ObservableObject {
        // fixme: update stencil
        let models: [LicenseModel] = [
            LicenseModel(name: PlistFiles.CombineStorable.name, plist: PlistFiles.CombineStorable.preferenceSpecifiers),
            LicenseModel(name: PlistFiles.PlaygroundTester.name, plist: PlistFiles.PlaygroundTester.preferenceSpecifiers),
            LicenseModel(name: PlistFiles.SwiftUIWorkaround.name, plist: PlistFiles.SwiftUIWorkaround.preferenceSpecifiers)
        ] 
    }
    
    final class Binding: ObservableObject {
        // NOP
    }
}


// MARK: - Private
private extension LicenseViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

