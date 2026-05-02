//
//  Wallpaper.swift
//  Spectral
//
//  Created by Temir Atambayev on 02/05/2026.
//

struct Wallpaper: Codable, Identifiable, Hashable {
    let id: String
    let imageUrl: String
    let thumbnailUrl: String?
    let collectionId: String?
    let isPremium: Bool
}
