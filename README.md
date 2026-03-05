<<<<<<< HEAD
# TRAVEL-MASTER-NI-KORICS-rovic
may theme toggle switch
=======
# TravelMate - Premium Flutter Travel Planner App

A production-ready, Apple iOS-inspired travel itinerary planner built with Flutter 3.x, featuring clean architecture, glassmorphism design, dark mode support, and smooth animations.

## 🎯 Features

- **Create & Manage Trips**: Organize multiple travel plans with detailed descriptions
- **Destination Management**: Add multiple destinations per trip with location details and notes
- **Activity Planning**: Create activity checklists for each destination
- **Progress Tracking**: Real-time visual progress bars showing trip completion status
- **Dark Mode**: Full dark/light theme toggle with smooth transitions
- **Glassmorphism UI**: Premium frosted glass design with blur effects
- **Smooth Animations**: Hero transitions, fade animations, and state change animations
- **Responsive Design**: Adaptive layouts for phones and tablets
- **Clean Architecture**: Separation of concerns with clear layer boundaries
- **Type-Safe**: Full null safety enabled
- **Production-Ready**: Clean code following Flutter best practices

## 🏗️ Architecture

The app follows **Clean Architecture** principles:

```
lib/
├── main.dart                 # App entry point and routing
├── models/                   # Data models
│   ├── trip.dart
│   ├── destination.dart
│   ├── activity.dart
│   └── models.dart          # Index
├── providers/                # State management (Provider)
│   ├── trip_provider.dart
│   ├── theme_provider.dart
│   └── providers.dart       # Index
├── screens/                  # UI Screens
│   ├── home_screen.dart
│   ├── trip_details_screen.dart
│   ├── add_trip_screen.dart
│   ├── add_destination_screen.dart
│   ├── add_activity_screen.dart
│   └── screens.dart         # Index
├── widgets/                  # Reusable UI Components
│   ├── glass_card.dart
│   ├── gradient_background.dart
│   ├── animated_progress_bar.dart
│   ├── animated_checkbox.dart
│   └── widgets.dart         # Index
└── theme/                    # Theme configuration
    ├── app_theme.dart
    └── theme.dart           # Index
```

## 🎨 Design System

### Color Palette

**Light Mode:**
- Primary: Deep Blue (#1565C0)
- Accent: Teal (#00BFA5)
- Glass: White with 18-25% opacity
- Text: #212121 (primary), 70% opacity (secondary)

**Dark Mode:**
- Primary: Dark Navy (#0D1B2A)
- Accent: Deep Teal (#00BFA5)
- Glass: Dark translucent with 12-18% opacity
- Text: White (primary), 70% opacity (secondary)

### Typography

- **Large Headers**: 32px, 700 weight (display)
- **Section Headers**: 20px, 600 weight
- **Body Text**: 16px, 400 weight
- **Small Text**: 14px, 400 weight

### Spacing

Uses 8/16/24 spacing system:
- Small: 8px
- Medium: 16px
- Large: 24px
- Extra Large: 32px

## 🚀 Getting Started

### Prerequisites

- Flutter 3.0+
- Dart 3.0+

### Installation

1. **Navigate to project directory**
   ```bash
   cd "Advanced Mobile Development/Term 1 sa vscode"
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### For iOS

```bash
cd ios
pod install
cd ..
flutter run
```

## 📦 Dependencies

- **provider** (6.0.0+): State management
- **uuid** (4.0.0+): Unique ID generation
- **intl** (0.19.0+): Date/time formatting
- **flutter**: Material Design 3 + Cupertino styling

## 🎮 Usage Guide

### Creating a Trip

1. Tap the floating action button (+)
2. Enter trip name and description
3. Select start and end dates
4. Tap "Create Trip"

### Adding Destinations

1. Open a trip
2. Tap the location floating action button
3. Enter destination name, location, and notes
4. Tap "Add Destination"

### Creating Activities

1. Open a trip destination
2. Tap "Activity" button
3. Enter activity description
4. Tap "Add Activity"

### Tracking Progress

- Each activity has a checkbox to mark as complete
- Completion percentage updates automatically
- Visual progress bar shows trip progress at a glance

### Toggling Dark Mode

- Dark mode toggle is in the top-right of the home screen
- Uses CupertinoSwitch for iOS-style appearance
- Theme persists during the session

## 🎬 Animations

- **Page Transitions**: Slide + Fade (CupertinoPageRoute style)
- **Activity Checkbox**: Scale + rotation on toggle
- **Progress Bar**: Smooth cubic animation
- **Destination Expansion**: Height animation on tap
- **Theme Change**: Smooth color transition
- **Activity Completion**: Opacity fade for completed items

## 🛠️ State Management

### TripProvider

Manages all trip-related state:
- `addTrip()` - Create new trip
- `deleteTrip()` - Remove trip
- `addDestination()` - Add destination to trip
- `addActivity()` - Add activity to destination
- `toggleActivityCompletion()` - Mark activity as done

### ThemeProvider

Manages theme state:
- `toggleTheme()` - Switch between light/dark
- `isDarkMode` - Check current theme
- `setLightMode()` / `setDarkMode()` - Set specific theme

## 📱 Responsive Design

- Adaptive padding based on screen width
- Flexible layouts that work on phones and tablets
- Single-column layout maintaining readability
- Centered content on wider screens

## 🎯 Key Implementation Details

### Glassmorphism

Uses `BackdropFilter` with `ImageFilter.blur()` to create frosted glass effect:
- Blur radius: 15-25 pixels
- Opacity: 18-25% light, 12-18% dark
- Border: Subtle white outline

### Dark Mode Implementation

Full theme switching with:
- `ThemeData` light/dark variants
- Color palette separation
- Smooth transitions via Provider
- CupertinoSwitch UI element

### Hero Animations

Trip card hero animation during navigation:
```dart
Hero(
  tag: 'trip-${trip.id}',
  child: GlassCard(...),
)
```

### Clean Architecture Benefits

- **Separation of Concerns**: Models, Providers, UI clearly separated
- **Testability**: Each layer can be tested independently
- **Maintainability**: Easy to locate and modify features
- **Scalability**: Simple to add new screens and features
- **Reusability**: Widgets and providers are highly reusable

## 📝 Null Safety

The entire project is built with full null safety:
- No nullable types unless explicitly marked with `?`
- Type-safe color and value handling
- Safe navigation with `?.` operator

## 🚦 Error Handling

- Form validation on all input screens
- Null checking in data layer
- Safe provider lookups
- User-friendly error messages

## 🔒 Production Readiness

- Clean, well-commented code
- Follows Flutter style guide
- No console warnings or errors
- Optimized performance
- Proper resource cleanup (TextEditingController disposal)
- Safe navigation and state management

## 📄 License

This project is for educational purposes.

## 🙋 Support

For issues or questions, check the code comments throughout the project for implementation details.

---

**Built with ❤️ for Mobile Excellence**
>>>>>>> b7132888990e065005d27eca52ea2f766b688011
