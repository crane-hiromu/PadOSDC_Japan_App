import SwiftUI

struct SessionDetailUserView: View {
    
    let user: SessionUser?
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

private struct SessionDetailUserImage: View {
    
    let icon: String?
    
    var body: some View {
        if let img = icon {
            Image(img)
                .resizable()
                .frame(width: 24, height: 24)
                .cornerRadius(12)
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .cornerRadius(12)
        }
    }
}

private struct SessionDetailUserNameLabel: View {
    
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title3)
            .foregroundColor(.white)
            .padding(.trailing, 4)
    }
}

private struct SessionDetailUserSnsButton: View {
    
    let account: String?
    let didTap: () -> Void
    
    var body: some View {
        if let account = account {
            Button(action: didTap) {
                HStack(spacing: 8) {
                    Image("logo_twitter")
                        .resizable()
                        .frame(width: 22, height: 22)
                    Text(account)
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
