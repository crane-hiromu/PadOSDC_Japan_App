import SwiftUI

// MARK: - View
struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
        VStack {
            Asset.mapUniversity.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
            Asset.mapFloor.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: 672, alignment: .center) // iPad readable width
        .offset(viewModel.binding.offset)
        .scaleEffect(viewModel.binding.scale)
        .gesture(simultaneousGesture)
        .navigationBarTitle(L10n.infoTypeMap, displayMode: .inline)
    }
}

// MARK: - Private
private extension MapView {
    
    var simultaneousGesture: some Gesture {
        let magnificationGesture = MagnificationGesture()
            .onChanged { viewModel.input.didChangeImageMagnification.send($0) }
            .onEnded { viewModel.input.didEndImageMagnification.send($0) }
        
        let dragGesture = DragGesture()
            .onChanged { viewModel.input.didChangeImageOffset.send($0.translation) }
            .onEnded{ _ in
                viewModel.binding.initialOffset = viewModel.binding.offset
                
            }
        
        return SimultaneousGesture(magnificationGesture, dragGesture)
    }
}
