# Personal Design System

A minimal Flutter design system showcase, deployed to the web via Vercel.

## Live

_URL will be available after Vercel deployment._

## Development

```bash
flutter pub get
flutter run -d chrome
```

## Build

```bash
flutter build web --release
```

Output: `build/web/`

## Structure

- `lib/core/` — design tokens (colors, typography, dimensions)
- `lib/pages/` — showcase pages
- `assets/fonts/` — Pretendard (OFL-1.1)
- `docs/` — design reference (component spec CSV)
- `vercel.json` — deployment config
