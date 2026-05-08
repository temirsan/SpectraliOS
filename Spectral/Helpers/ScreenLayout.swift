import SwiftUI

enum ScreenLayout {
    static let contentTopCornerRadius: CGFloat = 48
    static let contentPaddingHorizontal: CGFloat = 12
    static let contentPaddingTop: CGFloat = 14
    static let contentPaddingBottom: CGFloat = 12
    static let contentGridSpacing: CGFloat = 12

    static var gridContentPadding: EdgeInsets {
        EdgeInsets(
            top: contentPaddingTop,
            leading: contentGridSpacing,
            bottom: contentGridSpacing,
            trailing: contentGridSpacing
        )
    }

    static var scrollContentPadding: EdgeInsets {
        EdgeInsets(
            top: contentPaddingTop,
            leading: contentPaddingHorizontal,
            bottom: contentPaddingBottom,
            trailing: contentPaddingHorizontal
        )
    }

    static func contentSheetShape(nestedCorners: Bool = true, defaultCornerSize: CGFloat = 12) -> UnevenRoundedRectangle {
        let topRadius = nestedCorners ? contentTopCornerRadius : defaultCornerSize
        return UnevenRoundedRectangle(
            topLeadingRadius: topRadius,
            bottomLeadingRadius: 0,
            bottomTrailingRadius: 0,
            topTrailingRadius: topRadius
        )
    }

    static func gridCardShape(
        index: Int,
        columns: Int,
        defaultCornerSize: CGFloat = 12,
        nestedCorners: Bool = true
    ) -> UnevenRoundedRectangle {
        let nestedSize = nestedCorners ? max(contentTopCornerRadius - contentGridSpacing, 0) : defaultCornerSize
        let isTopRow = index < columns
        let topLeading = isTopRow && index == 0 ? nestedSize : defaultCornerSize
        let topTrailing = isTopRow && index == columns - 1 ? nestedSize : defaultCornerSize
        return UnevenRoundedRectangle(
            topLeadingRadius: topLeading,
            bottomLeadingRadius: defaultCornerSize,
            bottomTrailingRadius: defaultCornerSize,
            topTrailingRadius: topTrailing
        )
    }
}
