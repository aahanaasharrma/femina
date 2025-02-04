import 'package:flutter/material.dart';
import 'views/screens/landing_page.dart'; // Import the Landing Page
import 'views/screens/auth_screen.dart'; // Ensure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF641D15),
        ),
        useMaterial3: true,
      ),
    );
  }
}
