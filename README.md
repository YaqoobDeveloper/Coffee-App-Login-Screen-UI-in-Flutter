# Coffee-App-Login-Screen-UI-in-Flutter

A coffee shop ("Qahwa") login screen built with Flutter: a green dome with a drink hero, pill-shaped email/password fields with validation, a Log In button and social sign-in buttons.

**Live demo:** https://yaqoobdeveloper.github.io/Coffee-App-Login-Screen-UI-in-Flutter/

The UI is split into small, reusable components (React Native style):

```
lib/
├── screens/qahwa_login_screen.dart
├── components/qahwa/   # AuthHeader, DrinkHero, GreenDome, PillTextField, ...
├── theme/qahwa_colors.dart
└── utils/validators.dart
```

## Run

```bash
flutter pub get
flutter run
```
