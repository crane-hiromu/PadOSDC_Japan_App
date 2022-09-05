import SwiftUI

// MARK: - View
struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
        VStack {
            mapUniversityImage
            mapFloorImage
        }
        .onDisappear { viewModel.input.didDisappear.send(()) }
        .frame(maxWidth: 672, alignment: .center) // iPad readable width
        .offset(viewModel.binding.offset)
        .scaleEffect(viewModel.binding.scale)
        .gesture(SimultaneousGesture(magnificationGesture, dragGesture))
        .navigationBarTitle(L10n.infoTypeMap, displayMode: .inline)
    }
}

// MARK: - Private
private extension MapView {
    
    var mapUniversityImage: some View {
        Asset.mapUniversity.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var mapFloorImage: some View {
        Asset.mapFloor.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { viewModel.input.didChangeImageMagnification.send($0) }
            .onEnded { viewModel.input.didEndImageMagnification.send($0) }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { viewModel.input.didChangeImageOffset.send($0.translation) }
            .onEnded{ viewModel.input.didEndImageOffset.send($0.translation) }
    }
}
