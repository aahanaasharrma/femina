import 'package:flutter/material.dart';
import 'dob.dart'; // Import the next page

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background4.png', // Ensure this is in assets and pubspec.yaml
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40), // Adjust spacing
                    // Title
                    const Text(
                      'Tell us more about yourself',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF641D15),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Subtitle
                    const Text(
                      'Please enter your legal name. This information will be used to verify your account.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // First Name Input
                    const Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Last Name Input
                    const Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Spacing before button
                    // Next Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DOBScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD55454),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Extra spacing at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
