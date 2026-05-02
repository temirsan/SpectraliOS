//
//  ExploreScreen.swift
//  Spectral
//
//  Created by Temir Atambayev on 01/05/2026.
//

import SwiftUI

struct ExploreScreen: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // 2. Sample colors for your squares
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan, .]

    var body: some View {
        ScrollView {
            // 3. The Grid container
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<colors.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(colors[index])
                        .aspectRatio(1, contentMode: .fit) // Keeps them as perfect squares
                        .overlay(
                            Text("Square \(index + 1)")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                }
            }
            .padding()
        }
    }
}
