import 'package:femina/views/screens/auth_page.dart';
import 'package:flutter/material.dart';

import '../views/initial_page.dart';
import '../views/screens/landing_page.dart';    // Update with your actual home page file

class AppRoutes {
  static const String landing = '/landing';
  static const String auth = '/auth'; // Change this to your actual main screen
  static const String initial = '/initial'; // Change this to your actual initial screen

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthPage()); // Replace with your actual home screen
      case initial:
        return MaterialPageRoute(builder: (_) => const InitialPage()); // Replace with your actual initial screen
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
