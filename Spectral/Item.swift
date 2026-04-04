//
//  Item.swift
//  Spectral
//
//  Created by Temir Atambayev on 04/04/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
