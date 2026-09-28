# Dayn

A calmer way to manage your debts. Flutter front end built 1:1 from the Adobe XD
design in `design/dayn-design.xd`. No backend: every string and number on screen
comes from `lib/data/app_content.dart`.

## Run

```bash
flutter pub get
flutter run -d chrome        # or any iOS / Android device
```

## Layout

| Path | What |
|---|---|
| `lib/data/app_content.dart` | All static copy and sample data (edit here) |
| `lib/theme/` | Colours and typography from the XD file |
| `lib/ui/canvas.dart` | 428 x 926 design canvas + positioned primitives |
| `lib/ui/common.dart` | Header, tab bar, buttons, progress ring, form pieces |
| `lib/screens/` | One file per XD screen |
| `lib/app_router.dart` | Screen wiring, mirrors the XD prototype links |
| `assets/icons/` | SVGs exported from the XD artboards |
| `design/reference/` | PNG renders of each artboard, for side-by-side checks |

## Screens (XD artboard numbers)

1 Splash · 2/7/8 Welcome (3 swipe pages) · 6 Create Account / Sign in ·
3 Home · 4/5 My Debts (Active / Completed) · 9 Add debt step 1 ·
10 Add debt step 2 · 11 Debt saved · 12 My Goals

## Fonts

The design uses **Gotham Rounded**, a licensed font that is not included.
The family name is kept as `Gotham Rounded` in `pubspec.yaml` but currently
points at Nunito. To switch to the real font, drop the Gotham Rounded files
into `assets/fonts/` and replace the single `Nunito[wght].ttf` entry with the
Light / Book / Medium / Bold files (weights 300 / 400 / 500 / 700). No code
changes needed. Tajawal (Arabic) and Poppins (badge) are bundled.

## TestFlight upload

Bump the build number in `pubspec.yaml` (`1.0.0+N`), then:

```bash
flutter build ipa --release --export-method app-store
xcodebuild -exportArchive -archivePath build/ios/archive/Runner.xcarchive \
  -exportOptionsPlist ios/ExportOptions.plist -exportPath build/ios/ipa -allowProvisioningUpdates
```

Requires Xcode to be signed in to the team's Apple ID (Xcode > Settings > Accounts).
