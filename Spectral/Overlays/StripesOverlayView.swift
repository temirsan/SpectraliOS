import SwiftUI

private extension StripeOrientation {
    var densityMultiplier: Float {
        switch self {
        case .vertical:   return 1.0
        case .horizontal: return 1.5
        case .diagonal:   return 3.0
        case .reversed:   return 3.0
        }
    }
}

private extension StripesData {
    var effectiveStripeCount: Int {
        Int(Float(numberOfStripes) * orientation.densityMultiplier)
    }

    var gradientColors: [Color] {
        let base: [Color] = [
            gradientColor.color.opacity(Double(gradientStart)),
            gradientColor.color.opacity(Double(gradientEnd))
        ]
        return isGradientReversed ? base.reversed() : base
    }
}

struct StripesOverlayView: View {
    let data: StripesData
    let imageURL: URL?

    var body: some View {
        ZStack {
            AsyncImage(url: imageURL) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Rectangle().fill(.gray.opacity(0.3))
            }
            .blur(radius: CGFloat(data.blur))

            Canvas { context, size in
                drawStripes(context: context, size: size, data: data)
            }
        }
        .clipped()
    }
}

private func drawStripes(context: GraphicsContext, size: CGSize, data: StripesData) {
    let colors = data.gradientColors
    let count = data.effectiveStripeCount

    switch data.orientation {
    case .vertical:
        let stripeWidth = size.width / CGFloat(count)
        for i in 0..<count {
            let x = CGFloat(i) * stripeWidth
            context.fill(
                Path(CGRect(x: x, y: 0, width: stripeWidth, height: size.height)),
                with: .linearGradient(
                    Gradient(colors: colors),
                    startPoint: CGPoint(x: x, y: 0),
                    endPoint: CGPoint(x: x + stripeWidth, y: 0)
                )
            )
        }

    case .horizontal:
        let stripeHeight = size.height / CGFloat(count)
        for i in 0..<count {
            let y = CGFloat(i) * stripeHeight
            context.fill(
                Path(CGRect(x: 0, y: y, width: size.width, height: stripeHeight)),
                with: .linearGradient(
                    Gradient(colors: colors),
                    startPoint: CGPoint(x: 0, y: y),
                    endPoint: CGPoint(x: 0, y: y + stripeHeight)
                )
            )
        }

    case .diagonal, .reversed:
        let angle: Double = data.orientation == .diagonal ? 45 : 135
        let diagonal = hypot(size.width, size.height)
        var rotatedContext = context
        rotatedContext.translateBy(x: size.width / 2, y: size.height / 2)
        rotatedContext.rotate(by: .degrees(angle))
        rotatedContext.translateBy(x: -size.width / 2, y: -size.height / 2)
        drawDiagonalStripes(context: rotatedContext, size: size, count: count, colors: colors, diagonal: diagonal)
    }
}

private func drawDiagonalStripes(context: GraphicsContext, size: CGSize, count: Int, colors: [Color], diagonal: CGFloat) {
    let startX = -diagonal
    let totalWidth = size.width + 2 * diagonal
    let stripeWidth = totalWidth / CGFloat(count)
    for i in 0..<count {
        let x = startX + CGFloat(i) * stripeWidth
        context.fill(
            Path(CGRect(x: x, y: -diagonal, width: stripeWidth, height: size.height + 2 * diagonal)),
            with: .linearGradient(
                Gradient(colors: colors),
                startPoint: CGPoint(x: x, y: 0),
                endPoint: CGPoint(x: x + stripeWidth, y: 0)
            )
        )
    }
}

#Preview {
    StripesOverlayView(
        data: StripesData(
            blur: 0,
            numberOfStripes: 20,
            orientation: .vertical,
            gradientColor: .black,
            gradientStart: 0,
            gradientEnd: 0.4,
            isGradientReversed: false
        ),
        imageURL: URL(string: "https://picsum.photos/600/1200")
    )
    .aspectRatio(9/19.5, contentMode: .fit)
    .padding()
}
