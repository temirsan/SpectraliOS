import SwiftUI

struct WallpaperPreviewScreen: View {
    let wallpaper: Wallpaper

    var body: some View {
        Text(wallpaper.id)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden(false)
    }
}
