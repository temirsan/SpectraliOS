import SwiftUI

struct ExploreScreen: View {
    private var columns: Int {
        #if canImport(UIKit)
        // iPhone: 2 columns
        guard UIDevice.current.userInterfaceIdiom == .pad else { return 2 }
        let size = UIScreen.main.bounds.size
        let shortest = min(size.width, size.height)
        // iPad mini typically has a 744pt compact side; standard iPads are 810pt+
        return shortest <= 744 ? 3 : 4
        #else
        return 2
        #endif
    }

    let colors: [Color] = [
        .red, .blue, .green, .yellow, .purple, .orange,
        .pink, .cyan, .brown, .mint, .indigo, .teal
    ]

    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: ScreenLayout.contentGridSpacing), count: columns)
    }

    var body: some View {
        ZStack(alignment: .top) {
#if canImport(UIKit)
            Color(UIColor.systemGray6).ignoresSafeArea()
#else
            Color.gray.opacity(0.1).ignoresSafeArea()
#endif

            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: ScreenLayout.contentGridSpacing) {
                    ForEach(Array(colors.enumerated()), id: \.offset) { index, color in
                        NavigationLink(value: Wallpaper.sample) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(color)
                                .aspectRatio(1, contentMode: .fit)
                                .clipShape(ScreenLayout.gridCardShape(index: index, columns: columns))
                        }
                        .buttonStyle(.plain)
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
            ToolbarItem(placement: .topBarLeading) {
                Button { } label: { Image(systemName: "shuffle") }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button { } label: { Image(systemName: "gearshape") }
            }
        }
    }
}

#Preview {
    ExploreScreen()
}
