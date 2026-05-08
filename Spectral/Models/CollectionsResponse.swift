import Foundation

struct CollectionsResponse: Codable {
    let projectRoot: String
    let collections: [CollectionEntry]

    enum CodingKeys: String, CodingKey {
        case projectRoot = "project_root"
        case collections
    }
}

struct CollectionEntry: Codable {
    let id: String
    let title: String
    let titles: [String: String]
    let isPremium: Bool
    let `extension`: String
    let items: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, titles, `extension`, items
        case isPremium = "is_premium"
    }
}
