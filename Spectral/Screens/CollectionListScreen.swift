//
//  CollectionListScreen.swift
//  Spectral
//
//  Created by Temir Atambayev on 01/05/2026.
//

import SwiftUI

struct CollectionListScreen: View {
    let columns = [
        GridItem(.flexible()),
    ]
    
    let categories: [ThemeCategory] = [
        ThemeCategory(id : "1", title : "Collection 1", titles: ["en": "Collection 1"], coverUrl: "https://picsum.photos/600/300?random=1", previewUrls: [], isPremium: true),
        ThemeCategory(id : "2", title : "Collection 2", titles: ["en": "Collection 2"], coverUrl: "https://picsum.photos/600/300?random=2", previewUrls: [], isPremium: true),
        ThemeCategory(id : "3", title : "Collection 3", titles: ["en": "Collection 3"], coverUrl: "https://picsum.photos/600/300?random=3", previewUrls: [], isPremium: true),
        ThemeCategory(id : "4", title : "Collection 4", titles: ["en": "Collection 4"], coverUrl: "https://picsum.photos/600/300?random=4", previewUrls: [], isPremium: true),
    ]
  

    var body: some View {
        ScrollView {
            // 3. The Grid container
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(categories) { category in
                    NavigationLink(value: category) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.purple.opacity(0.3))
                            .aspectRatio(2, contentMode: .fit) // Keeps them as perfect squares
                            .overlay {
                                Text(category.localizedTitle())
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CollectionListScreen()
}

#Preview("iPad") {
    CollectionListScreen().previewDevice("iPad Pro 13-inch (M4)")
}
