import Foundation

enum OverlayType: Codable {
    case none
    case stripes(StripesData)
    case rectangular(RectangularData)
    case hexagons(HexagonsData)
    case circles(CirclesData)
    case dotted(DottedData)
    case texture(TextureData)
    case waves(WavesData)
    case glassStripes(GlassStripesData)
    case glassStripesWavy(GlassStripesData)
    case glassStripesLadder(GlassStripesData)
    case glassStripesStacked(GlassStripesData)
    case glassStripesSymmetry(GlassStripesSymmetryData)
    case dropletGrid(DropletGridData)
    case liquidSquares(LiquidSquaresData)
    case liquidPyramid(LiquidPyramidData)
    case pixelate(PixelateData)

    var isPremium: Bool {
        switch self {
        case .glassStripes, .glassStripesWavy, .glassStripesLadder,
             .glassStripesStacked, .glassStripesSymmetry,
             .dropletGrid, .liquidSquares, .liquidPyramid, .pixelate:
            return true
        default:
            return false
        }
    }

    var isHeavyOverlay: Bool {
        switch self {
        case .glassStripes, .glassStripesWavy, .glassStripesLadder,
             .glassStripesStacked, .glassStripesSymmetry, .dropletGrid, .liquidSquares:
            return true
        default:
            return false
        }
    }
}

enum StripeOrientation: String, Codable {
    case vertical, horizontal, diagonal, reversed
}

struct StripesData: Codable {
    var blur: Float = 15
    var numberOfStripes: Int = 20
    var orientation: StripeOrientation = .vertical
    var gradientColor: CodableColor = .black
    var gradientStart: Float = 0
    var gradientEnd: Float = 0.2
    var isGradientReversed: Bool = false
}

struct RectangularData: Codable {
    var color: CodableColor = .white
    var opacity: Float = 0.15
    var lineWidth: Float = 1
    var spacing: Float = 40
}

struct HexagonsData: Codable {
    var color: CodableColor = .white
    var opacity: Float = 0.15
    var size: Float = 40
    var lineWidth: Float = 1
}

struct CirclesData: Codable {
    var color: CodableColor = .white
    var opacity: Float = 0.15
    var spacing: Float = 40
    var lineWidth: Float = 1
}

struct DottedData: Codable {
    var color: CodableColor = .white
    var opacity: Float = 0.3
    var dotRadius: Float = 2
    var spacing: Float = 20
}

struct TextureData: Codable {
    var opacity: Float = 0.15
    var scale: Float = 1.0
}

struct WavesData: Codable {
    var color: CodableColor = .white
    var opacity: Float = 0.15
    var amplitude: Float = 20
    var frequency: Float = 3
    var lineWidth: Float = 1
}

struct GlassStripesData: Codable {
    var blurRadius: Float = 0
    var refractionHeight: Float = 0.35
    var refractionAmount: Float = 0.4
    var chromaticAberration: Float = 0
}

struct GlassStripesSymmetryData: Codable {
    var blurRadius: Float = 0
    var refractionHeight: Float = 0.35
    var refractionAmount: Float = 0.4
    var chromaticAberration: Float = 0
    var mirrorCount: Int = 4
}

struct DropletGridData: Codable {
    var blurRadius: Float = 0
    var dropletSize: Float = 60
    var refractionAmount: Float = 0.4
}

struct LiquidSquaresData: Codable {
    var blurRadius: Float = 0
    var squareSize: Float = 80
    var refractionAmount: Float = 0.4
    var chromaticAberration: Float = 0
}

struct LiquidPyramidData: Codable {
    var blurRadius: Float = 0
    var refractionAmount: Float = 0.4
    var chromaticAberration: Float = 0
    var levels: Int = 5
}

struct PixelateData: Codable {
    var pixelSize: Float = 20
}

enum GlassTextBackground: String, Codable {
    case none, preset, upload
}

struct GlassTextParams: Codable {
    var text: String = ""
    var textSize: Float = 80
    var blurRadius: Float = 10
    var letterSpacing: Float = 0
    var refractionHeight: Float = 0.35
    var refractionAmount: Float = 0.4
    var chromaticAberration: Float = 0
    var tintColor: CodableColor = .white
    var tintStrength: Float = 0.2
    var offsetX: Float = 0
    var offsetY: Float = 0
    var backgroundType: GlassTextBackground = .none
}
