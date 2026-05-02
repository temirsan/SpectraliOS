# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

Open `Spectral.xcodeproj` in Xcode and run with Cmd+R. No package manager setup required — zero external dependencies.

**CLI builds (via xcodebuild):**
```bash
# Build
xcodebuild -project Spectral.xcodeproj -scheme Spectral -destination 'platform=iOS Simulator,name=iPhone 16' build

# Run unit tests
xcodebuild test -project Spectral.xcodeproj -scheme Spectral -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:SpectralTests

# Run UI tests
xcodebuild test -project Spectral.xcodeproj -scheme Spectral -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:SpectralUITests
```

## Architecture

**SwiftUI + SwiftData, tab-based app.** No UIKit.

- `SpectralApp.swift` — app entry point; configures `ModelContainer` with the SwiftData `Schema`
- `ContentView.swift` — root `TabView` with four tabs
- One file per screen: `ExploreScreen`, `OverlayListScreen`, `CollectionListScreen`, `MyLibraryScreen`
- `Item.swift` — SwiftData `@Model` (currently the only persistent entity)

State management is plain SwiftUI (`@State`, `@Environment`). No separate view models or observable objects yet.

## Key Details

- **Min deployment target:** iOS 17.6 (Debug) / 26.4 (Release)
- **Swift version:** 5.0
- **No CI/CD** configured
- Tests in `SpectralTests/` and `SpectralUITests/` are template stubs — add real tests alongside new features
