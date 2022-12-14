import Foundation
import SwiftUI
import Combine
import CombineStorable

// MARK: - ViewModel
final class AppearanceSettingsViewModel: NSObject, Storable, ObservableObject {
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
extension AppearanceSettingsViewModel {
    
    final class Input {
        init() {}
    }
    
    final class Output {
        init() {}
    }
    
    final class Binding: ObservableObject {
        @AppStorage var appearanceMode: AppearanceMode
        
        init(
            appearanceMode: AppearanceMode = .default,
            userDefaults: UserDefaults = UserDefaults.standard
        ) {
            self._appearanceMode = AppStorage(
                wrappedValue: appearanceMode,
                .appearanceMode,
                store: userDefaults
            )
        }
    }
}

// MARK: - Private
private extension AppearanceSettingsViewModel {
    
    func bind(input: Input, output: Output, binding: Binding) {
        // 親孫でのbindを可能にする
        binding.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
