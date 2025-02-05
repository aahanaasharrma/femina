import 'package:flutter/material.dart';
import 'calendar1.dart';

class LogPeriodScreen extends StatelessWidget {
  const LogPeriodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background6.png', // Ensure the background6.png is in the assets folder
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0), // Padding for content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                Center(
                  child: Image.asset(
                    'assets/image4.png', // Make sure the image is present in the assets folder
                    width: 361,
                    height: 331,
                  ),
                ),
                const SizedBox(height: 30), // Space after the image

                // Heading
                const Text(
                  'Log your periods to get accurate predictions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF641D15),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10), // Space after heading

                // Description
                const Text(
                  'We will try to accurately predict your next period.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(), // Pushes the button to the bottom

                // Add Dates Button
                Center(
                  child: ElevatedButton(
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calendar1Screen()),
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
                      'Add Dates',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
