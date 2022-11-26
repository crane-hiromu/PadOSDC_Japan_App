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
                SessionDetailUserTwitterButton(
                    account: user.twAccount,
                    didTap: didTapSns
                )
                Spacer().frame(width: 8)
                SessionDetailUserYoutubeButton()
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
        }
    }
}

// MARK: - Label
private struct SessionDetailUserNameLabel: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.headline)
            .padding(.trailing, 4)
    }
}

// MARK: - Button
private struct SessionDetailUserTwitterButton: View {
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

private struct SessionDetailUserYoutubeButton: View {
    var body: some View {
        Button(action: { print("tap youtube button") }) {
            HStack(spacing: 8) {
                Image("logo_youtube")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
