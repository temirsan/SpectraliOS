//
//  OverlayListScreen.swift
//  Spectral
//
//  Created by Temir Atambayev on 01/05/2026.
//
import SwiftUI

struct OverlayListScreen: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // 2. Sample colors for your squares
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan, .brown, .black]

    var body: some View {
        
        ZStack(alignment: .top) {
#if canImport(UIKit)
            Color(UIColor.systemGray6).ignoresSafeArea()
#else
            Color.gray.opacity(0.1).ignoresSafeArea()
#endif

            ScrollView {
                LazyVGrid(columns: columns, spacing: ScreenLayout.contentGridSpacing) {
                    ForEach(0..<colors.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colors[index])
                            .aspectRatio(2, contentMode: .fit)
                            .clipShape(ScreenLayout.gridCardShape(index: index, columns: 2))
                            .overlay(
                                Text("Square \(index + 1)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding(ScreenLayout.gridContentPadding)
            }
            .background(Color(.systemBackground))
            .clipShape(ScreenLayout.contentSheetShape())
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationTitle("Spectral")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { } label: { Image(systemName: "gearshape") }
            }
        }
        
    }
}

#Preview {
    OverlayListScreen()
}
