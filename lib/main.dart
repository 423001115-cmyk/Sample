import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TripProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const TravelMateApp(),
    ),
  );
}

/// Main application widget
class TravelMateApp extends StatelessWidget {
  const TravelMateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;

    return MaterialApp(
      title: 'TravelMate',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HomeScreen(),
      routes: _buildRoutes(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  /// Build named routes
  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/add-trip': (context) => const AddTripScreen(),
    };
  }

  /// Handle dynamic routes with arguments
  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/trip-details':
        final tripId = settings.arguments as String;
        return _buildPageRoute(
          TripDetailsScreen(tripId: tripId),
          settings,
        );
      case '/add-destination':
        final tripId = settings.arguments as String;
        return _buildPageRoute(
          AddDestinationScreen(tripId: tripId),
          settings,
        );
      case '/add-activity':
        final args = settings.arguments as Map<String, String>;
        return _buildPageRoute(
          AddActivityScreen(
            tripId: args['tripId']!,
            destinationId: args['destinationId']!,
          ),
          settings,
        );
      default:
        return null;
    }
  }

  /// Build a page route with smooth transitions
  PageRoute<dynamic> _buildPageRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        var fadeAnimation = animation.drive(
          Tween<double>(begin: 0.0, end: 1.0).chain(
            CurveTween(curve: curve),
          ),
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
