import Foundation

enum WallpaperSource: Hashable {
    case remote(Wallpaper)
    case preset(WallpaperPreset)
    case upload(URL)
    case libraryItem(LibraryItem)
}
