import SwiftUI

// MARK: - View
struct LicenseView: View {

    var body: some View {
        Text("-----")
            .onAppear {
                let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                do {
                    let contentUrls = try FileManager.default.contentsOfDirectory(at: documentDirectoryURL, includingPropertiesForKeys: nil)
                    let files = contentUrls.map{$0.lastPathComponent}
                    print("------1 1", files)
                } catch {
                    print("------1 2", error)
                }
                
                NSSearchPathForDirectoriesInDomains(.documentDirectory,Foundation.FileManager.SearchPathDomainMask.userDomainMask, true).forEach {
                    do {
                        print("------2 1", try FileManager.default.contentsOfDirectory(atPath: "\($0)"))
                    } catch {
                        print("------2 2", error)
                    }
                }
                
                print("-----3", Bundle.main.path(forResource: "App/Resources/License/com.mono0926.LicensePlist", ofType: "plist"))
            }
    }
}

