import SwiftData
import Foundation

@Model
final class LibraryItem {
    var id: UUID = UUID()
    var collectionType: String
    var sourceType: String
    var sourcePayload: String
    var overlayJson: String?
    var thumbnailPath: String?
    var createdAt: Date = Date()

    init(collectionType: String, sourceType: String, sourcePayload: String,
         overlayJson: String? = nil, thumbnailPath: String? = nil) {
        self.collectionType = collectionType
        self.sourceType = sourceType
        self.sourcePayload = sourcePayload
        self.overlayJson = overlayJson
        self.thumbnailPath = thumbnailPath
    }
}

enum LibraryCollection {
    static let favourite = "FAVOURITE"
    static let myEdit    = "MY_EDIT"
}

enum LibrarySource {
    static let remote    = "REMOTE"
    static let preset    = "PRESET"
    static let upload    = "UPLOAD"
    static let glassText = "GLASS_TEXT"
}
