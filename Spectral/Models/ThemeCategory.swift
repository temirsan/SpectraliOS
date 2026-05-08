//
//  ThemeCategory.swift
//  Spectral
//
//  Created by Temir Atambayev on 02/05/2026.
//
import Foundation

struct ThemeCategory: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let titles: [String: String]
    let coverUrl: String
    let previewUrls: [String]
    let isPremium: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title, titles
        case coverUrl = "cover_url"
        case previewUrls = "preview_urls"
        case isPremium = "is_premium"
    }
    
    func localizedTitle() -> String {
        let currentLanguageCode = Locale.current.language.languageCode?.identifier ?? "en"
        return titles[currentLanguageCode] ?? title
    }
    static let sample = ThemeCategory(
            id: "premium",
            title: "Premium",
            titles: ["en": "Premium", "ru": "Премиум"],
            coverUrl: "https://example.com/cover.jpg",
            previewUrls: [],
            isPremium: true
        )
}
