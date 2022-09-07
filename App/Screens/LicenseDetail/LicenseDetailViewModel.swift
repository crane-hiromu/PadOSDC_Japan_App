import SwiftUI
import Foundation
import Combine
import CombineStorable


// MARK: - ViewModel
final class LicenseDetailViewModel: NSObject, ObservableObject, Storable {
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
    }
}

// MARK: - Property
extension LicenseDetailViewModel {
    
    final class Input {
        // NOP
    }
    
    final class Output: ObservableObject {
        let model: LicenseModel
        
        init(model: LicenseModel = .init(name: "", plist: [])) {
            self.model = model
        }
    }
    
    final class Binding: ObservableObject {
        // NOP
    }
}
