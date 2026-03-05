# TravelMate Development Guide

## Quick Start

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run the App
```bash
flutter run
```

Or with a specific device:
```bash
flutter run -d <device-id>
```

## Project Structure Overview

The app is organized using Clean Architecture with clear separation of concerns:

### Models Layer (`lib/models/`)
- **Trip**: Represents a complete travel plan
- **Destination**: Represents a location within a trip
- **Activity**: Represents a task/activity at a destination

Models include:
- Business logic (e.g., `completionPercentage`, `durationInDays`)
- `copyWith()` methods for immutability
- Proper documentation

### Domain Layer (Business Logic)
Located in providers, handles all business rules and state management:
- TripProvider: Manages trip CRUD and state
- ThemeProvider: Manages app theme

### Presentation Layer (`lib/screens/` and `lib/widgets/`)

**Screens:**
- `HomeScreen`: Main screen showing all trips
- `TripDetailsScreen`: Shows trip details with destinations
- `AddTripScreen`: Form to create trips
- `AddDestinationScreen`: Form to add destinations
- `AddActivityScreen`: Form to add activities

**Reusable Widgets:**
- `GlassCard`: Glassmorphism container with blur
- `GradientBackground`: Animated gradient background
- `AnimatedProgressBar`: Smooth progress indicator
- `AnimatedCheckbox`: Interactive activity checkbox

### Theme Layer (`lib/theme/`)
- Complete Material 3 theme setup
- Light and dark theme variants
- Color palettes for easy customization
- Typography system

## Key Features Implementation

### Dark Mode
1. Controlled by `ThemeProvider`
2. Toggle via `CupertinoSwitch` in AppBar
3. Smooth transition between themes
4. All widgets adapt to `isDarkMode` flag

### Glassmorphism
Implemented using:
- `BackdropFilter` with `ImageFilter.blur()`
- Semi-transparent gradients
- Soft borders
- Box shadows for depth

### State Management
- Provider package for reactive updates
- `ChangeNotifier` for simple state
- `MultiProvider` for multiple providers
- Proper listener management

### Animations
- Page transitions with slide + fade
- Activity checkbox scale + rotation
- Progress bar smooth fill
- Destination accordion height animation
- Theme transition fade

### Form Validation
- TextFormField with built-in validation
- Custom validators for each field
- Error messages display inline

## Development Workflow

### Adding a New Feature

1. **Create Model** (if needed)
   ```dart
   class Feature {
     final String id;
     final String name;
     // ...
   }
   ```

2. **Extend Provider**
   ```dart
   void addFeature(Feature feature) {
     _features.add(feature);
     notifyListeners();
   }
   ```

3. **Create Screen**
   ```dart
   class FeatureScreen extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: GradientBackground(
           isDarkMode: context.watch<ThemeProvider>().isDarkMode,
           child: // ... content
         ),
       );
     }
   }
   ```

4. **Add Route**
   ```dart
   case '/feature':
     return _buildPageRoute(const FeatureScreen(), settings);
   ```

## Customization Guide

### Change Colors
Edit `lib/theme/app_theme.dart`:
```dart
const darkBlue = Color(0xFF1565C0);  // Change primary color
const tealAccent = Color(0xFF00BFA5); // Change accent
```

### Modify Spacing
Update the 8/16/24 system in widgets:
```dart
const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
```

### Adjust Animations
Change duration in Animation constructors:
```dart
AnimationController(
  duration: const Duration(milliseconds: 800), // Adjust speed
  vsync: this,
);
```

### Customize Fonts
In `pubspec.yaml`, add fonts to the assets section and update themes.

## Testing

### Run Tests
```bash
flutter test
```

### Test Widget
```dart
testWidgets('Button tap increments counter', (WidgetTester tester) async {
  await tester.pumpWidget(const TravelMateApp());
  expect(find.text('TravelMate'), findsOneWidget);
});
```

## Performance Tips

1. Use `const` constructor where possible
2. Avoid rebuilding entire widgets via Provider scoping
3. Use `RepaintBoundary` for expensive paints
4. Profile with DevTools: `flutter run -d chrome --profile`

## Common Issues

### Provider not updating?
- Ensure `notifyListeners()` is called
- Check that you're using `watch()` not `read()`

### Glassmorphism not blurred?
- Ensure `BackdropFilter` is inside `ClipRRect`
- Check `blurRadius` values

### Dark mode not switching?
- Verify `ThemeProvider` is in `MultiProvider`
- Check `themeMode` is properly bound in MaterialApp

## Deployment

### iOS
```bash
cd ios
pod install
cd ..
flutter build ios
```

### Android
```bash
flutter build apk
flutter build appbundle
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)
- [Glassmorphism Design](https://glassmorphism.com/)

---

Happy coding! 🚀
