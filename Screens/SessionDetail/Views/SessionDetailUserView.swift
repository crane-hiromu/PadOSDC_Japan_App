import SwiftUI

// MARK: - View
struct SessionDetailUserView: View {
    let user: User?
    let didTapSns: () -> Void
    
    var body: some View {
        if let user = user {
            HStack(spacing: 8) {
                SessionDetailUserImage(icon: user.icon)
                SessionDetailUserNameLabel(name: user.name)
                SessionDetailUserSnsButton(
                    account: user.twAccount,
                    didTap: didTapSns
                )
            }
        }
    }
}

// MARK: - Image
private struct SessionDetailUserImage: View {
    let icon: String?
    
    var body: some View {
        if let img = icon {
            Image(img)
                .resizable()
                .frame(width: 20, height: 20)
                .cornerRadius(12)
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .cornerRadius(12)
                .foregroundColor(.white)
        }
    }
}

// MARK: - Label
private struct SessionDetailUserNameLabel: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.headline)
            .foregroundColor(.white)
            .padding(.trailing, 4)
    }
}

// MARK: - Button
private struct SessionDetailUserSnsButton: View {
    let account: String?
    let didTap: () -> Void
    
    var body: some View {
        if let account = account {
            Button(action: didTap) {
                HStack(spacing: 8) {
                    Image("logo_twitter")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(account)
                        .font(.headline)
                        .foregroundColor(.cyan)
                }
            }
        }
    }
}
