import SwiftUI

struct CodableColor: Codable, Hashable {
    let r, g, b, a: Double
    var color: Color { Color(red: r, green: g, blue: b, opacity: a) }
    static let black = CodableColor(r: 0, g: 0, b: 0, a: 1)
    static let white = CodableColor(r: 1, g: 1, b: 1, a: 1)
}

enum GradientType: String, Codable, Hashable, CaseIterable {
    case linearVertical, linearHorizontal, linearDiagonal, diagonalAlt
    case radial, sweep, glowBottom, glowTop, glowCorner, dualGlow
}

enum MeshStyle: String, Codable, Hashable, CaseIterable {
    case smooth, wavy, aurora, plasma, crystalline
}

enum PatternType: String, Codable, Hashable, CaseIterable {
    case stripes, checkerboard, polkaDots, concentricCircles, chevron
    case diamonds, honeycomb, crossHatch, scales, seigaiha, isoCubes
    case concentricSquares, triskelion, spiral, stars
}

struct SolidPreset: Codable, Hashable {
    var color: CodableColor = .black
}

struct GradientPreset: Codable, Hashable {
    var primary: CodableColor = .black
    var secondary: CodableColor = .white
    var gradientType: GradientType = .linearVertical

    enum CodingKeys: String, CodingKey {
        case primary, secondary
        case gradientType = "gradient_type"
    }
}

struct MeshPreset: Codable, Hashable {
    var primary: CodableColor = .black
    var secondary: CodableColor = .white
    var style: MeshStyle = .smooth
}

struct PatternPreset: Codable, Hashable {
    var primary: CodableColor = .black
    var secondary: CodableColor = .white
    var patternType: PatternType = .stripes
    var scale: Float = 1.0

    enum CodingKeys: String, CodingKey {
        case primary, secondary, scale
        case patternType = "pattern_type"
    }
}

struct MixPreset: Codable, Hashable {
    var background: GradientPreset = GradientPreset()
    var pattern: PatternPreset = PatternPreset()
}

enum WallpaperPreset: Codable, Hashable {
    case solid(SolidPreset)
    case gradient(GradientPreset)
    case mesh(MeshPreset)
    case pattern(PatternPreset)
    case mix(MixPreset)
}
