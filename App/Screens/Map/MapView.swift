import SwiftUI

// MARK: - View
struct MapView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Image("map_university")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("map_floor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: 672, alignment: .center)
        }
        .navigationBarTitle(Text("Info_Type_Map"), displayMode: .inline)
    }
}
