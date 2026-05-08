//
//  ContentView.swift
//  Spectral
//
//  Created by Temir Atambayev on 04/04/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            NavigationStack {
                ExploreScreen().navigationDestination(for: Wallpaper.self) { wallpaper in
                    WallpaperPreviewScreen(wallpaper: wallpaper)
                }
            }.tabItem {Label("Explore", systemImage: "safari")}.tag(0)
            NavigationStack {
                OverlayListScreen()
            }.tabItem {Label("Overlays", systemImage: "square.2.layers.3d.fill")}.tag(1)
            NavigationStack {
                CollectionListScreen().navigationDestination(for: ThemeCategory.self) { category in
                    CollectionDetailScreen(category: category)
                }
            }.tabItem {Label("Collections", systemImage: "square.split.1x2.fill")}.tag(2)
            NavigationStack {
                MyLibraryScreen()
            }.tabItem {Label("My Library", systemImage: "bookmark.square.fill")}.tag(3)
        }
    }
}
