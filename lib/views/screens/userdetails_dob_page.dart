import 'package:flutter/material.dart';
import 'tracking_reason.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({Key? key}) : super(key: key);

  @override
  _DOBScreenState createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String? _dobError;
  String? _weightError;
  String? _heightError;

  // Function to validate inputs
  bool _validateInputs() {
    setState(() {
      _dobError = _validateDOB(_dobController.text) ? null : '* The information entered is in the wrong format.';
      _weightError = _validateNumber(_weightController.text) ? null : '* The information entered is in the wrong format.';
      _heightError = _validateNumber(_heightController.text) ? null : '* The information entered is in the wrong format.';
    });

    return _dobError == null && _weightError == null && _heightError == null;
  }

  // Validate Date of Birth Format (DD/MM/YYYY)
  bool _validateDOB(String dob) {
    final RegExp dobRegex = RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$');
    return dobRegex.hasMatch(dob);
  }

  // Validate Numeric Input for Weight & Height
  bool _validateNumber(String input) {
    final RegExp numRegex = RegExp(r'^[0-9]+(\.[0-9]{1,2})?$'); // Allows up to two decimal places
    return numRegex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background5.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button with GestureDetector
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6CDCD),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between the back button and the title
                  
                  // Title
                  const Text(
                    'What is your date of birth?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF641D15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle
                  const Text(
                    'This will help in our predictions.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Date of Birth Input
                  const Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      hintText: 'DD/MM/YYYY',
                      hintStyle: const TextStyle(color: Color(0xFF89939E)),
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
                      errorText: _dobError,
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 20),
                  // Weight Input
                  const Text(
                    'Weight (in kgs)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _weightController,
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
                      errorText: _weightError,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  // Height Input
                  const Text(
                    'Height (in cms)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _heightController,
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
                      errorText: _heightError,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  // Terms and Conditions
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(text: 'By registering, you agree to our '),
                        TextSpan(
                          text: 'Terms of use',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD55454),
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policies',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD55454),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Next Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_validateInputs()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrackingReasonScreen()),
                          );
                        }
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
                        'Create Account',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Extra space for scrolling
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
