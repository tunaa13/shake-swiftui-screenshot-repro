import SwiftUI
import AVKit

struct RootView: View {
    var body: some View {
        TabView {
            PlayerPage()
            PlayerPage()
        }
        .tabViewStyle(.page)
    }
}

struct PlayerPage: View {
    @State private var showOverlay = true

    var body: some View {
        PlayerView()
            .overlay {
                if showOverlay {
                    Color.black.opacity(0.4)
                        .transition(.opacity)
                }
            }
            .onTapGesture {
                withAnimation {
                    showOverlay.toggle()
                }
            }
            .background(Color.black)
    }
}

struct PlayerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player = AVPlayer(
            url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        )
        controller.player = player
        player.play()
        return controller
    }
    func updateUIViewController(
        _ uiViewController: AVPlayerViewController,
        context: Context
    ) {}
}
