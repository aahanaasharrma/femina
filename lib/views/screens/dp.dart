import 'package:flutter/material.dart';
import 'name.dart';

class DpScreen extends StatefulWidget {
  const DpScreen({Key? key}) : super(key: key);

  @override
  State<DpScreen> createState() => _DpScreenState();
}

class _DpScreenState extends State<DpScreen> {
  bool _isDataCollected = false;
  bool _isRightsAgreed = false;

  bool get _canProceed => _isDataCollected && _isRightsAgreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background3.png'), // Add the image for background
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Padding for the entire content
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Data privacy image
                Image.asset('assets/images/dataprivacy.png'), // Add the image for data privacy

                const SizedBox(height: 20),

                // Your health. Your privacy text
                Text(
                  'Your health. Your privacy.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF641D15),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Privacy information
                Text(
                  'Your data will never be stored or shared with any company except Femina.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'By using this app, you consent to the collection and use of personal data, '
                  'solely for the purpose of predicting menstrual cycle dates and improving our app\'s functionality.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'You have the right to access, update, or delete your personal data stored within our app.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Consent form radio buttons
                Column(
                  children: [
                    // Data collected radio button
                    Row(
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue: _isDataCollected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isDataCollected = value!;
                            });
                          },
                        ),
                        const Text('I consent to the collection of my data'),
                      ],
                    ),
                    const SizedBox(height: 20), // Space between the buttons
                    // Rights agreed radio button
                    Row(
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue: _isRightsAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              _isRightsAgreed = value!;
                            });
                          },
                        ),
                        const Text('I agree to the rights mentioned'),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Next Button
                ElevatedButton(
                  onPressed: _canProceed
                      ? () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NameScreen()),
                          );
                       }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _canProceed ? Color(0xFFD55454) : Color(0xFFF6CDCD), // Change color based on selection
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
