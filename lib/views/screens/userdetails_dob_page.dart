import 'package:flutter/material.dart';
import 'tracking_reason_page.dart';
import 'package:intl/intl.dart'; // For formatting dates

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
      if (_dobController.text.isEmpty) {
        _dobError = '* Date of Birth is required.';
      } else {
        _dobError = null;
      }

      if (_weightController.text.isEmpty) {
        _weightError = '* Weight is required.';
      } else {
        _weightError = _validateNumber(_weightController.text) ? null : '* Invalid format.';
      }

      if (_heightController.text.isEmpty) {
        _heightError = '* Height is required.';
      } else {
        _heightError = _validateNumber(_heightController.text) ? null : '* Invalid format.';
      }
    });

    return _dobError == null && _weightError == null && _heightError == null;
  }

  // Validate Numeric Input for Weight & Height
  bool _validateNumber(String input) {
    final RegExp numRegex = RegExp(r'^[0-9]+(\.[0-9]{1,2})?$'); // Allows up to two decimal places
    return numRegex.hasMatch(input);
  }

  // Show Date Picker and update the TextField
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1), // Default selection
      firstDate: DateTime(1900), // Earliest date
      lastDate: DateTime.now(), // Can't pick a future date
    );

    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked); // Format date
      });
    }
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
                  const SizedBox(height: 20),

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

                  // Date of Birth Input (with Date Picker)
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
                    readOnly: true, // Prevent manual input
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      hintText: 'Select your date of birth',
                      suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: _dobError,
                    ),
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
                      hintText: 'Enter your weight (kg)',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
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
                      hintText: 'Enter your height (cm)',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE7EAEB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: _heightError,
                    ),
                    keyboardType: TextInputType.number,
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
