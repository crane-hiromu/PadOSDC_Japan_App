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
        let models: [String] = [
            PlistFiles.CombineStorable.name,
            PlistFiles.PlaygroundTester.name,
            PlistFiles.SwiftUIWorkaround.name,
            PlistFiles.ComMono0926LicensePlist.name,
        ] 
    }
    
    final class Binding: ObservableObject {
        // NOP
    }
}


// MARK: - Private
private extension LicenseViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // NOP
    }
}
