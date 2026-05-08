import SwiftUI

struct ExploreScreen: View {
    private let columns = 2

    let colors: [Color] = [
        .red, .blue, .green, .yellow, .purple, .orange,
        .pink, .cyan, .brown, .mint, .indigo, .teal
    ]

    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: ScreenLayout.contentGridSpacing), count: columns)
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGray6).ignoresSafeArea()

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
