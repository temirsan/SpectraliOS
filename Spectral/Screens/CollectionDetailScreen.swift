//
//  CollectionDetailScreen.swift
//  Spectral
//
//  Created by Temir Atambayev on 09/05/2026.
//

import SwiftUI

struct CollectionDetailScreen: View {
    let category : ThemeCategory
    var body: some View {
        Text("CollectionDetailScreen")
#if os(iOS) || os(visionOS)
            .toolbar(.hidden, for: .tabBar)
#endif
    }
}
